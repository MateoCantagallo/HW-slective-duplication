#!/bin/bash

# Script to compare baseline (none), selective duplication, and legacy full duplication modes
# This script focuses on dynamic power consumption differences (cc1, cc2, cc3)

echo "=== Three-Way Duplication Mode Comparison Script (Dynamic Power Focus) ==="
echo ""

# Configuration
INST_COUNT=1000000
TEST_CONFIG="test.arg"
ADDR_FILE="test_addresses.txt"
BASELINE_OUTPUT="baseline_output.txt"
SELECTIVE_OUTPUT="selective_output.txt"
LEGACY_OUTPUT="legacy_output.txt"
COMPARISON_REPORT="comparison_report.txt"

# Check prerequisites
if [ ! -f "./sim-outorder-none" ]; then
    echo "ERROR: sim-outorder-none executable not found!"
    echo "Please ensure the baseline simulator (without duplication) exists"
    exit 1
fi

if [ ! -f "./sim-outorder" ]; then
    echo "ERROR: sim-outorder executable not found!"
    echo "Please compile the simulator first with 'make'"
    exit 1
fi

if [ ! -f "./$TEST_CONFIG" ]; then
    echo "ERROR: $TEST_CONFIG not found!"
    echo "Please ensure the test configuration file exists"
    exit 1
fi

if [ ! -f "./$ADDR_FILE" ]; then
    echo "WARNING: $ADDR_FILE not found, creating default one..."
    cat > $ADDR_FILE << EOF
# Default test addresses for selective duplication
0x12000023c
0x120000240
0x120000244
EOF
fi

echo "Configuration:"
echo "  Instructions: $INST_COUNT"
echo "  Config file: $TEST_CONFIG"
echo "  Address file: $ADDR_FILE"
echo "  Simulators: sim-outorder-none (baseline), sim-outorder (with duplication)"
echo "  Addresses to duplicate:"
cat $ADDR_FILE | grep -v "^#" | grep -v "^$"
echo ""

# Function to extract key statistics from simulator output
extract_stats() {
    local output_file=$1
    local mode_name=$2
    
    echo "=== $mode_name Statistics ===" > "${output_file}.stats"
    
    # Extract key performance metrics
    grep -E "(sim_num_insn|sim_cycle|sim_IPC|sim_CPI)" "$output_file" >> "${output_file}.stats"
    
    # Extract duplication-specific stats
    grep -E "(Total Number of Added|Total Number of Selection|Loaded.*addresses)" "$output_file" >> "${output_file}.stats"
    
    # Extract dynamic power consumption (cc1, cc2, cc3)
    grep -E "(avg_total_power_cycle_cc1|avg_total_power_cycle_cc2|avg_total_power_cycle_cc3)" "$output_file" >> "${output_file}.stats"
    
    # Extract cache statistics
    grep -E "(il1\.|dl1\.|ul2\.)" "$output_file" | grep -E "(accesses|hits|misses|miss_rate)" >> "${output_file}.stats"
    
    # Extract branch predictor stats
    grep -E "bpred.*\.(lookups|updates|hits|misses)" "$output_file" >> "${output_file}.stats"
    
    # Extract functional unit usage
    grep -E "(integer-ALU|FP-adder|FP-MULT)" "$output_file" >> "${output_file}.stats"
}

# Function to run simulation and capture output
run_simulation() {
    local mode_name=$1
    local output_file=$2
    local simulator=$3
    local extra_args=$4
    
    echo "Running $mode_name mode..."
    echo "Command: ./$simulator $extra_args -max:inst $INST_COUNT $TEST_CONFIG"
    echo ""
    
    # Run simulation and capture both stdout and stderr
    timeout 120 ./$simulator $extra_args -max:inst $INST_COUNT $TEST_CONFIG > "$output_file" 2>&1
    
    local exit_code=$?
    if [ $exit_code -eq 124 ]; then
        echo "ERROR: $mode_name simulation timed out!"
        return 1
    elif [ $exit_code -ne 0 ]; then
        echo "ERROR: $mode_name simulation failed with exit code $exit_code"
        echo "Last 20 lines of output:"
        tail -20 "$output_file"
        return 1
    fi
    
    echo "$mode_name simulation completed successfully"
    echo "Output saved to: $output_file"
    echo ""
    
    # Extract statistics
    extract_stats "$output_file" "$mode_name"
    
    return 0
}

# Clean up previous results
rm -f $BASELINE_OUTPUT $SELECTIVE_OUTPUT $LEGACY_OUTPUT $COMPARISON_REPORT
rm -f ${BASELINE_OUTPUT}.stats ${SELECTIVE_OUTPUT}.stats ${LEGACY_OUTPUT}.stats

echo "Starting three-way comparison simulations..."
echo ""

# Run baseline mode (no duplication at all)
if ! run_simulation "Baseline (No Duplication)" "$BASELINE_OUTPUT" "sim-outorder-none" ""; then
    echo "Baseline mode failed, aborting comparison"
    exit 1
fi

# Run selective mode
if ! run_simulation "Selective Duplication" "$SELECTIVE_OUTPUT" "sim-outorder" "-duplicate:addr_file $ADDR_FILE"; then
    echo "Selective mode failed, aborting comparison"
    exit 1
fi

# Run legacy mode (full duplication)
if ! run_simulation "Legacy (Full Duplication)" "$LEGACY_OUTPUT" "sim-outorder" ""; then
    echo "Legacy mode failed, aborting comparison"
    exit 1
fi

echo "All three simulations completed. Generating comparison report..."
echo ""

# Generate detailed comparison report
cat > $COMPARISON_REPORT << EOF
======================================================================
    THREE-WAY DUPLICATION MODE COMPARISON REPORT (DYNAMIC POWER FOCUS)
======================================================================
Generated on: $(date)
Test Configuration: $TEST_CONFIG
Instructions Simulated: $INST_COUNT
Selective Duplication Addresses: $(cat $ADDR_FILE | grep -v "^#" | grep -v "^$" | wc -l) addresses

======================================================================
                         SUMMARY COMPARISON
======================================================================

Performance Metrics Comparison:
================================
EOF

# Extract and compare sim_num_insn
baseline_insn=$(grep "sim_num_insn " $BASELINE_OUTPUT | head -1 | awk '{print $2}')
selective_insn=$(grep "sim_num_insn " $SELECTIVE_OUTPUT | head -1 | awk '{print $2}')
legacy_insn=$(grep "sim_num_insn " $LEGACY_OUTPUT | head -1 | awk '{print $2}')
echo "Instructions Committed:" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_insn" >> $COMPARISON_REPORT
echo "  Selective: $selective_insn" >> $COMPARISON_REPORT
echo "  Legacy:    $legacy_insn" >> $COMPARISON_REPORT
if [ "$baseline_insn" = "$selective_insn" ] && [ "$selective_insn" = "$legacy_insn" ]; then
    echo "  ✓ All instruction counts match" >> $COMPARISON_REPORT
else
    echo "  ⚠️  DIFFERENCES DETECTED in instruction counts!" >> $COMPARISON_REPORT
fi
echo "" >> $COMPARISON_REPORT

# Extract and compare sim_cycle
baseline_cycles=$(grep "sim_cycle " $BASELINE_OUTPUT | awk '{print $2}')
selective_cycles=$(grep "sim_cycle " $SELECTIVE_OUTPUT | awk '{print $2}')
legacy_cycles=$(grep "sim_cycle " $LEGACY_OUTPUT | awk '{print $2}')
echo "Simulation Cycles:" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_cycles" >> $COMPARISON_REPORT
echo "  Selective: $selective_cycles" >> $COMPARISON_REPORT
echo "  Legacy:    $legacy_cycles" >> $COMPARISON_REPORT

# Calculate differences vs baseline
sel_diff=$((selective_cycles - baseline_cycles))
leg_diff=$((legacy_cycles - baseline_cycles))
echo "  📊 Differences vs Baseline:" >> $COMPARISON_REPORT
echo "    Selective: $sel_diff cycles" >> $COMPARISON_REPORT
echo "    Legacy:    $leg_diff cycles" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT

# Extract and compare IPC
baseline_ipc=$(grep "sim_IPC " $BASELINE_OUTPUT | awk '{print $2}')
selective_ipc=$(grep "sim_IPC " $SELECTIVE_OUTPUT | awk '{print $2}')
legacy_ipc=$(grep "sim_IPC " $LEGACY_OUTPUT | awk '{print $2}')
echo "Instructions Per Cycle (IPC):" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_ipc" >> $COMPARISON_REPORT
echo "  Selective: $selective_ipc" >> $COMPARISON_REPORT
echo "  Legacy:    $legacy_ipc" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT

# Compare duplication statistics
echo "Duplication Statistics:" >> $COMPARISON_REPORT
echo "======================" >> $COMPARISON_REPORT

# Check for duplication messages
baseline_added=$(grep "Total Number of Added Instrction in Rename" $BASELINE_OUTPUT | awk '{print $NF}' 2>/dev/null || echo "0")
selective_added=$(grep "Total Number of Added Instrction in Rename" $SELECTIVE_OUTPUT | awk '{print $NF}' 2>/dev/null || echo "0")
legacy_added=$(grep "Total Number of Added Instrction in Rename" $LEGACY_OUTPUT | awk '{print $NF}' 2>/dev/null || echo "0")

echo "Instructions Added in Rename:" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_added" >> $COMPARISON_REPORT
echo "  Selective: $selective_added" >> $COMPARISON_REPORT
echo "  Legacy:    $legacy_added" >> $COMPARISON_REPORT

# Check for address loading in selective mode
if grep -q "Loaded.*addresses for selective duplication" $SELECTIVE_OUTPUT; then
    addr_count=$(grep "Loaded.*addresses for selective duplication" $SELECTIVE_OUTPUT | grep -o '[0-9]\+' | head -1)
    echo "  ✓ Selective mode loaded $addr_count addresses successfully" >> $COMPARISON_REPORT
else
    echo "  ⚠️  No address loading message found in selective mode" >> $COMPARISON_REPORT
fi
echo "" >> $COMPARISON_REPORT

# Compare DYNAMIC power consumption (cc1, cc2, cc3) - THIS IS THE KEY SECTION
echo "Dynamic Power Consumption Analysis:" >> $COMPARISON_REPORT
echo "===================================" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT

# CC1 Power (Aggressive Power Gating)
baseline_cc1=$(grep "avg_total_power_cycle_cc1" $BASELINE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")
selective_cc1=$(grep "avg_total_power_cycle_cc1" $SELECTIVE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")
legacy_cc1=$(grep "avg_total_power_cycle_cc1" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")

echo "CC1 Power (Aggressive Power Gating):" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_cc1 W" >> $COMPARISON_REPORT
echo "  Selective: $selective_cc1 W" >> $COMPARISON_REPORT
echo "  Legacy:    $legacy_cc1 W" >> $COMPARISON_REPORT

# Calculate percentage increases for CC1
if [ "$baseline_cc1" != "N/A" ] && [ "$selective_cc1" != "N/A" ] && [ "$legacy_cc1" != "N/A" ]; then
    sel_cc1_increase=$(echo "scale=2; ($selective_cc1 - $baseline_cc1) / $baseline_cc1 * 100" | bc 2>/dev/null || echo "calc_error")
    leg_cc1_increase=$(echo "scale=2; ($legacy_cc1 - $baseline_cc1) / $baseline_cc1 * 100" | bc 2>/dev/null || echo "calc_error")
    echo "  📈 Percentage increase vs Baseline:" >> $COMPARISON_REPORT
    echo "    Selective: $sel_cc1_increase%" >> $COMPARISON_REPORT
    echo "    Legacy:    $leg_cc1_increase%" >> $COMPARISON_REPORT
fi
echo "" >> $COMPARISON_REPORT

# CC2 Power (Proportional Scaling)
baseline_cc2=$(grep "avg_total_power_cycle_cc2" $BASELINE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")
selective_cc2=$(grep "avg_total_power_cycle_cc2" $SELECTIVE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")
legacy_cc2=$(grep "avg_total_power_cycle_cc2" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")

echo "CC2 Power (Proportional Scaling):" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_cc2 W" >> $COMPARISON_REPORT
echo "  Selective: $selective_cc2 W" >> $COMPARISON_REPORT
echo "  Legacy:    $legacy_cc2 W" >> $COMPARISON_REPORT

# Calculate percentage increases for CC2
if [ "$baseline_cc2" != "N/A" ] && [ "$selective_cc2" != "N/A" ] && [ "$legacy_cc2" != "N/A" ]; then
    sel_cc2_increase=$(echo "scale=2; ($selective_cc2 - $baseline_cc2) / $baseline_cc2 * 100" | bc 2>/dev/null || echo "calc_error")
    leg_cc2_increase=$(echo "scale=2; ($legacy_cc2 - $baseline_cc2) / $baseline_cc2 * 100" | bc 2>/dev/null || echo "calc_error")
    echo "  📈 Percentage increase vs Baseline:" >> $COMPARISON_REPORT
    echo "    Selective: $sel_cc2_increase%" >> $COMPARISON_REPORT
    echo "    Legacy:    $leg_cc2_increase%" >> $COMPARISON_REPORT
fi
echo "" >> $COMPARISON_REPORT

# CC3 Power (Conservative with Leakage)
baseline_cc3=$(grep "avg_total_power_cycle_cc3" $BASELINE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")
selective_cc3=$(grep "avg_total_power_cycle_cc3" $SELECTIVE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")
legacy_cc3=$(grep "avg_total_power_cycle_cc3" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")

echo "CC3 Power (Conservative with Leakage):" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_cc3 W" >> $COMPARISON_REPORT
echo "  Selective: $selective_cc3 W" >> $COMPARISON_REPORT
echo "  Legacy:    $legacy_cc3 W" >> $COMPARISON_REPORT

# Calculate percentage increases for CC3
if [ "$baseline_cc3" != "N/A" ] && [ "$selective_cc3" != "N/A" ] && [ "$legacy_cc3" != "N/A" ]; then
    sel_cc3_increase=$(echo "scale=2; ($selective_cc3 - $baseline_cc3) / $baseline_cc3 * 100" | bc 2>/dev/null || echo "calc_error")
    leg_cc3_increase=$(echo "scale=2; ($legacy_cc3 - $baseline_cc3) / $baseline_cc3 * 100" | bc 2>/dev/null || echo "calc_error")
    echo "  📈 Percentage increase vs Baseline:" >> $COMPARISON_REPORT
    echo "    Selective: $sel_cc3_increase%" >> $COMPARISON_REPORT
    echo "    Legacy:    $leg_cc3_increase%" >> $COMPARISON_REPORT
fi
echo "" >> $COMPARISON_REPORT

# Power Model Explanation
echo "Power Model Explanation:" >> $COMPARISON_REPORT
echo "========================" >> $COMPARISON_REPORT
echo "CC1 (Aggressive): Uses full power when active, aggressive power gating" >> $COMPARISON_REPORT
echo "CC2 (Proportional): Linear scaling based on actual resource utilization" >> $COMPARISON_REPORT
echo "CC3 (Conservative): Same as CC2 but includes leakage power when idle" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT

# Compare cache statistics
echo "Cache Performance:" >> $COMPARISON_REPORT
echo "==================" >> $COMPARISON_REPORT

for cache in "il1" "dl1" "ul2"; do
    echo "$cache Cache:" >> $COMPARISON_REPORT
    
    # Accesses
    baseline_acc=$(grep "${cache}\.accesses" $BASELINE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "0")
    selective_acc=$(grep "${cache}\.accesses" $SELECTIVE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "0")
    legacy_acc=$(grep "${cache}\.accesses" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "0")
    echo "  Accesses - Baseline: $baseline_acc, Selective: $selective_acc, Legacy: $legacy_acc" >> $COMPARISON_REPORT
    
    # Miss rate
    baseline_miss=$(grep "${cache}\.miss_rate" $BASELINE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "0")
    selective_miss=$(grep "${cache}\.miss_rate" $SELECTIVE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "0")
    legacy_miss=$(grep "${cache}\.miss_rate" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "0")
    echo "  Miss Rate - Baseline: $baseline_miss, Selective: $selective_miss, Legacy: $legacy_miss" >> $COMPARISON_REPORT
    echo "" >> $COMPARISON_REPORT
done

# Functional Unit Usage Comparison
echo "Functional Unit Usage:" >> $COMPARISON_REPORT
echo "======================" >> $COMPARISON_REPORT

# Look for FU usage patterns - always show all three modes
if grep -q "integer-ALU" $BASELINE_OUTPUT; then
    echo "Baseline Mode FU Usage:" >> $COMPARISON_REPORT
    grep "integer-ALU\|FP-adder\|FP-MULT" $BASELINE_OUTPUT | head -5 >> $COMPARISON_REPORT
    echo "" >> $COMPARISON_REPORT
else
    echo "Baseline Mode FU Usage:" >> $COMPARISON_REPORT
    echo "  No FU usage statistics found in baseline output" >> $COMPARISON_REPORT
    echo "" >> $COMPARISON_REPORT
fi

if grep -q "integer-ALU" $SELECTIVE_OUTPUT; then
    echo "Selective Mode FU Usage:" >> $COMPARISON_REPORT
    grep "integer-ALU\|FP-adder\|FP-MULT" $SELECTIVE_OUTPUT | head -5 >> $COMPARISON_REPORT
    echo "" >> $COMPARISON_REPORT
else
    echo "Selective Mode FU Usage:" >> $COMPARISON_REPORT
    echo "  No FU usage statistics found in selective output" >> $COMPARISON_REPORT
    echo "" >> $COMPARISON_REPORT
fi

if grep -q "integer-ALU" $LEGACY_OUTPUT; then
    echo "Legacy Mode FU Usage:" >> $COMPARISON_REPORT
    grep "integer-ALU\|FP-adder\|FP-MULT" $LEGACY_OUTPUT | head -5 >> $COMPARISON_REPORT
    echo "" >> $COMPARISON_REPORT
else
    echo "Legacy Mode FU Usage:" >> $COMPARISON_REPORT
    echo "  No FU usage statistics found in legacy output" >> $COMPARISON_REPORT
    echo "" >> $COMPARISON_REPORT
fi

# Error Analysis
echo "Error Analysis:" >> $COMPARISON_REPORT
echo "===============" >> $COMPARISON_REPORT

# Check for assertion failures or errors
baseline_errors=$(grep -i "error\|assert\|panic\|abort" $BASELINE_OUTPUT | wc -l)
selective_errors=$(grep -i "error\|assert\|panic\|abort" $SELECTIVE_OUTPUT | wc -l)
legacy_errors=$(grep -i "error\|assert\|panic\|abort" $LEGACY_OUTPUT | wc -l)

echo "Error/Warning Count:" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_errors" >> $COMPARISON_REPORT
echo "  Selective: $selective_errors" >> $COMPARISON_REPORT
echo "  Legacy:    $legacy_errors" >> $COMPARISON_REPORT

total_errors=$((baseline_errors + selective_errors + legacy_errors))
if [ $total_errors -gt 0 ]; then
    echo "  ⚠️  Errors detected in simulation output" >> $COMPARISON_REPORT
    if [ $baseline_errors -gt 0 ]; then
        echo "  Baseline errors:" >> $COMPARISON_REPORT
        grep -i "error\|assert\|panic\|abort" $BASELINE_OUTPUT | head -3 >> $COMPARISON_REPORT
    fi
    if [ $selective_errors -gt 0 ]; then
        echo "  Selective errors:" >> $COMPARISON_REPORT
        grep -i "error\|assert\|panic\|abort" $SELECTIVE_OUTPUT | head -3 >> $COMPARISON_REPORT
    fi
    if [ $legacy_errors -gt 0 ]; then
        echo "  Legacy errors:" >> $COMPARISON_REPORT
        grep -i "error\|assert\|panic\|abort" $LEGACY_OUTPUT | head -3 >> $COMPARISON_REPORT
    fi
else
    echo "  ✓ No errors detected in any mode" >> $COMPARISON_REPORT
fi
echo "" >> $COMPARISON_REPORT

# File Information
echo "======================================================================" >> $COMPARISON_REPORT
echo "                         FILE INFORMATION" >> $COMPARISON_REPORT
echo "======================================================================" >> $COMPARISON_REPORT
echo "Full output files:" >> $COMPARISON_REPORT
echo "  Baseline mode:  $BASELINE_OUTPUT" >> $COMPARISON_REPORT
echo "  Selective mode: $SELECTIVE_OUTPUT" >> $COMPARISON_REPORT
echo "  Legacy mode:    $LEGACY_OUTPUT" >> $COMPARISON_REPORT
echo "  This report:    $COMPARISON_REPORT" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT
echo "File sizes:" >> $COMPARISON_REPORT
echo "  Baseline output:  $(wc -l < $BASELINE_OUTPUT) lines, $(du -h $BASELINE_OUTPUT | cut -f1)" >> $COMPARISON_REPORT
echo "  Selective output: $(wc -l < $SELECTIVE_OUTPUT) lines, $(du -h $SELECTIVE_OUTPUT | cut -f1)" >> $COMPARISON_REPORT
echo "  Legacy output:    $(wc -l < $LEGACY_OUTPUT) lines, $(du -h $LEGACY_OUTPUT | cut -f1)" >> $COMPARISON_REPORT

# Display the report
echo "Three-way comparison completed! Report generated in: $COMPARISON_REPORT"
echo ""
echo "=== QUICK SUMMARY (DYNAMIC POWER FOCUS) ==="
echo "CC1 Power (Aggressive):"
echo "  Baseline: $baseline_cc1 W, Selective: $selective_cc1 W, Legacy: $legacy_cc1 W"
echo "CC2 Power (Proportional):"
echo "  Baseline: $baseline_cc2 W, Selective: $selective_cc2 W, Legacy: $legacy_cc2 W"
echo "CC3 Power (Conservative):"
echo "  Baseline: $baseline_cc3 W, Selective: $selective_cc3 W, Legacy: $legacy_cc3 W"
echo ""
echo "Instructions Added in Rename:"
echo "  Baseline:  $baseline_added"
echo "  Selective: $selective_added"
echo "  Legacy:    $legacy_added"
echo ""
echo "For detailed comparison, view: $COMPARISON_REPORT"
echo ""

# Ask if user wants to see the report
read -p "Would you like to view the detailed comparison report now? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    less "$COMPARISON_REPORT"
fi

echo "Comparison script completed successfully!"
