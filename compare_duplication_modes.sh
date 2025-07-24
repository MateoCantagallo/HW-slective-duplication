#!/bin/bash

# Script to compare baseline (none), percentage-based selective duplication, and legacy full duplication modes
# This script focuses on dynamic power consumption differences (cc1, cc2, cc3)
# Now supports multiple percentage-based duplication levels: 5%, 10%, 20%, 50%
# Usage: ./compare_duplication_modes.sh <run_name>

echo "=== Percentage-Based Duplication Mode Comparison Script (Dynamic Power Focus) ==="
echo ""

# Check if run name is provided
if [ $# -eq 0 ]; then
    echo "ERROR: Please provide a run name as a parameter"
    echo "Usage: $0 <run_name>"
    echo "Example: $0 experiment_1"
    exit 1
fi

RUN_NAME="$1"
RESULTS_DIR="results/$RUN_NAME"

# Create results directory structure
mkdir -p "$RESULTS_DIR"
echo "Created results directory: $RESULTS_DIR"

# Configuration
INST_COUNT=2200000
TEST_CONFIG="test.arg"
JSON_FILE="static_inst_profile.json"
BASELINE_OUTPUT="$RESULTS_DIR/baseline_output.txt"
LEGACY_OUTPUT="$RESULTS_DIR/legacy_output.txt"
COMPARISON_REPORT="$RESULTS_DIR/comparison_report.txt"

# Percentage levels to test
PERCENTAGES=(5 10 20 50)

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

if [ ! -f "./$JSON_FILE" ]; then
    echo "ERROR: $JSON_FILE not found!"
    echo "Please ensure the static instruction profile JSON file exists"
    exit 1
fi

# Function to create percentage-based duplication file
create_percentage_file() {
    local target_percent=$1
    local output_file="addresses_${target_percent}percent.txt"
    
    echo "Creating duplication file for ${target_percent}% coverage..."
    
    # Use Python to parse JSON and select addresses
    python3 << EOF > "$output_file"
import json
import sys

# Load the JSON file
with open('$JSON_FILE', 'r') as f:
    data = json.load(f)

# Sort addresses by percent value (highest first)
sorted_addresses = sorted(data.items(), key=lambda x: x[1]['percent'], reverse=True)

# Select addresses until we reach the target percentage
target = $target_percent
current_sum = 0.0
selected_addresses = []

for addr, info in sorted_addresses:
    if current_sum >= target:
        break
    selected_addresses.append(addr)
    current_sum += info['percent']

# Write addresses (without comments and without 0x prefix)
for addr in selected_addresses:
    # Remove 0x prefix if present
    clean_addr = addr.replace('0x', '') if addr.startswith('0x') else addr
    print(clean_addr)
EOF

    if [ $? -eq 0 ]; then
        echo "  ✓ Created $output_file with $(wc -l < $output_file) addresses"
        # Get the actual coverage from the Python script output (we need to capture it)
        local actual_coverage=$(python3 -c "
import json
with open('$JSON_FILE', 'r') as f:
    data = json.load(f)
sorted_addresses = sorted(data.items(), key=lambda x: x[1]['percent'], reverse=True)
target = $target_percent
current_sum = 0.0
for addr, info in sorted_addresses:
    if current_sum >= target:
        break
    current_sum += info['percent']
print(f'{current_sum:.6f}')
")
        echo "  📊 Coverage: ${actual_coverage}%"
    else
        echo "  ❌ Failed to create $output_file"
        return 1
    fi
    
    return 0
}

echo "Configuration:"
echo "  Instructions: $INST_COUNT"
echo "  Config file: $TEST_CONFIG"
echo "  JSON profile: $JSON_FILE"
echo "  Simulators: sim-outorder-none (baseline), sim-outorder (with duplication)"
echo "  Percentage levels: ${PERCENTAGES[*]}%"
echo ""

# Create percentage-based duplication files
echo "Creating percentage-based duplication files..."
for percent in "${PERCENTAGES[@]}"; do
    if ! create_percentage_file "$percent"; then
        echo "Failed to create duplication file for ${percent}%, aborting"
        exit 1
    fi
done
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
    
    # Extract dynamic power consumption (cc1, cc2, cc3) - use total power, not average
    grep -E "(total_power_cycle_cc1|total_power_cycle_cc2|total_power_cycle_cc3)" "$output_file" >> "${output_file}.stats"
    
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
    ./$simulator $extra_args -max:inst $INST_COUNT $TEST_CONFIG > "$output_file" 2>&1
    
    local exit_code=$?
    if [ $exit_code -eq 124 ]; then
        echo "ERROR: $mode_name simulation timed out!"
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
rm -f $BASELINE_OUTPUT $LEGACY_OUTPUT $COMPARISON_REPORT
rm -f ${BASELINE_OUTPUT}.stats ${LEGACY_OUTPUT}.stats
for percent in "${PERCENTAGES[@]}"; do
    rm -f "selective_${percent}percent_output.txt"
    rm -f "selective_${percent}percent_output.txt.stats"
done

echo "Starting percentage-based comparison simulations..."
echo ""

# Run baseline mode (no duplication at all)
if ! run_simulation "Baseline (No Duplication)" "$BASELINE_OUTPUT" "sim-outorder-none" ""; then
    echo "Baseline mode failed, aborting comparison"
    exit 1
fi

# Run percentage-based selective modes
declare -A selective_outputs
for percent in "${PERCENTAGES[@]}"; do
    addr_file="addresses_${percent}percent.txt"
    output_file="selective_${percent}percent_output.txt"
    selective_outputs[$percent]="$output_file"
    
    if ! run_simulation "Selective Duplication (${percent}%)" "$output_file" "sim-outordersel" "-cache:il1lat 2 -duplicate:addr_file $addr_file"; then
        echo "Selective ${percent}% mode failed, aborting comparison"
        exit 1
    fi
done

# Run legacy mode (full duplication)
if ! run_simulation "Legacy (Full Duplication)" "$LEGACY_OUTPUT" "sim-outorder" ""; then
    echo "Legacy mode failed, aborting comparison"
    exit 1
fi

echo "All simulations completed. Generating comparison report..."
echo ""

# Generate detailed comparison report
cat > $COMPARISON_REPORT << EOF
======================================================================
  PERCENTAGE-BASED DUPLICATION MODE COMPARISON REPORT (DYNAMIC POWER FOCUS)
======================================================================
Generated on: $(date)
Test Configuration: $TEST_CONFIG
Instructions Simulated: $INST_COUNT
JSON Profile Source: $JSON_FILE
Percentage Levels Tested: ${PERCENTAGES[*]}%

======================================================================
                         SUMMARY COMPARISON
======================================================================

Performance Metrics Comparison:
================================
EOF

# Extract and compare sim_num_insn
baseline_insn=$(grep "sim_num_insn " $BASELINE_OUTPUT | head -1 | awk '{print $2}')
legacy_insn=$(grep "sim_num_insn " $LEGACY_OUTPUT | head -1 | awk '{print $2}')
echo "Instructions Committed:" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_insn" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    insn=$(grep "sim_num_insn " $output_file | head -1 | awk '{print $2}')
    echo "  ${percent}% Sel:  $insn" >> $COMPARISON_REPORT
done
echo "  Legacy:    $legacy_insn" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT

# Extract and compare sim_cycle
baseline_cycles=$(grep "sim_cycle " $BASELINE_OUTPUT | awk '{print $2}')
legacy_cycles=$(grep "sim_cycle " $LEGACY_OUTPUT | awk '{print $2}')
echo "Simulation Cycles:" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_cycles" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    cycles=$(grep "sim_cycle " $output_file | awk '{print $2}')
    echo "  ${percent}% Sel:  $cycles" >> $COMPARISON_REPORT
done
echo "  Legacy:    $legacy_cycles" >> $COMPARISON_REPORT

# Calculate differences vs baseline
echo "  📊 Differences vs Baseline:" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    cycles=$(grep "sim_cycle " $output_file | awk '{print $2}')
    diff=$((cycles - baseline_cycles))
    echo "    ${percent}% Sel: $diff cycles" >> $COMPARISON_REPORT
done
leg_diff=$((legacy_cycles - baseline_cycles))
echo "    Legacy:    $leg_diff cycles" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT

# Extract and compare IPC
baseline_ipc=$(grep "sim_IPC " $BASELINE_OUTPUT | awk '{print $2}')
legacy_ipc=$(grep "sim_IPC " $LEGACY_OUTPUT | awk '{print $2}')
echo "Instructions Per Cycle (IPC):" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_ipc" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    ipc=$(grep "sim_IPC " $output_file | awk '{print $2}')
    echo "  ${percent}% Sel:  $ipc" >> $COMPARISON_REPORT
done
echo "  Legacy:    $legacy_ipc" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT

# Compare duplication statistics
echo "Duplication Statistics:" >> $COMPARISON_REPORT
echo "======================" >> $COMPARISON_REPORT

# Check for duplication messages
baseline_added=$(grep "Total Number of Added Instrction in Rename" $BASELINE_OUTPUT | awk '{print $NF}' 2>/dev/null || echo "0")
legacy_added=$(grep "Total Number of Added Instrction in Rename" $LEGACY_OUTPUT | awk '{print $NF}' 2>/dev/null || echo "0")

echo "Instructions Added in Rename:" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_added" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    added=$(grep "Total Number of Added Instrction in Rename" $output_file | awk '{print $NF}' 2>/dev/null || echo "0")
    echo "  ${percent}% Sel:  $added" >> $COMPARISON_REPORT
done
echo "  Legacy:    $legacy_added" >> $COMPARISON_REPORT

# Check for address loading in selective modes
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    if grep -q "Loaded.*addresses for selective duplication" $output_file; then
        addr_count=$(grep "Loaded.*addresses for selective duplication" $output_file | grep -o '[0-9]\+' | head -1)
        echo "  ✓ ${percent}% mode loaded $addr_count addresses successfully" >> $COMPARISON_REPORT
    else
        echo "  ⚠️  No address loading message found in ${percent}% mode" >> $COMPARISON_REPORT
    fi
done
echo "" >> $COMPARISON_REPORT

# Compare DYNAMIC power consumption (cc1, cc2, cc3) - THIS IS THE KEY SECTION
echo "Dynamic Power Consumption Analysis:" >> $COMPARISON_REPORT
echo "===================================" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT

# CC1 Power (Aggressive Power Gating)
baseline_cc1=$(grep -w "total_power_cycle_cc1" $BASELINE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")
legacy_cc1=$(grep -w "total_power_cycle_cc1" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")

echo "CC1 Power (Aggressive Power Gating):" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_cc1 W" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    cc1=$(grep -w "total_power_cycle_cc1" $output_file | awk '{print $2}' 2>/dev/null || echo "N/A")
    echo "  ${percent}% Sel:  $cc1 W" >> $COMPARISON_REPORT
done
echo "  Legacy:    $legacy_cc1 W" >> $COMPARISON_REPORT

# Calculate percentage increases for CC1
if [ "$baseline_cc1" != "N/A" ]; then
    echo "  📈 Percentage increase vs Baseline:" >> $COMPARISON_REPORT
    for percent in "${PERCENTAGES[@]}"; do
        output_file="${selective_outputs[$percent]}"
        cc1=$(grep -w "total_power_cycle_cc1" $output_file | awk '{print $2}' 2>/dev/null || echo "N/A")
        if [ "$cc1" != "N/A" ]; then
            increase=$(echo "scale=2; ($cc1 - $baseline_cc1) / $baseline_cc1 * 100" | bc 2>/dev/null || echo "calc_error")
            echo "    ${percent}% Sel: $increase%" >> $COMPARISON_REPORT
        fi
    done
    if [ "$legacy_cc1" != "N/A" ]; then
        leg_cc1_increase=$(echo "scale=2; ($legacy_cc1 - $baseline_cc1) / $baseline_cc1 * 100" | bc 2>/dev/null || echo "calc_error")
        echo "    Legacy:    $leg_cc1_increase%" >> $COMPARISON_REPORT
    fi
fi
echo "" >> $COMPARISON_REPORT

# CC2 Power (Proportional Scaling)
baseline_cc2=$(grep -w "total_power_cycle_cc2" $BASELINE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")
legacy_cc2=$(grep -w "total_power_cycle_cc2" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")

echo "CC2 Power (Proportional Scaling):" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_cc2 W" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    cc2=$(grep -w "total_power_cycle_cc2" $output_file | awk '{print $2}' 2>/dev/null || echo "N/A")
    echo "  ${percent}% Sel:  $cc2 W" >> $COMPARISON_REPORT
done
echo "  Legacy:    $legacy_cc2 W" >> $COMPARISON_REPORT

# Calculate percentage increases for CC2
if [ "$baseline_cc2" != "N/A" ]; then
    echo "  📈 Percentage increase vs Baseline:" >> $COMPARISON_REPORT
    for percent in "${PERCENTAGES[@]}"; do
        output_file="${selective_outputs[$percent]}"
        cc2=$(grep -w "total_power_cycle_cc2" $output_file | awk '{print $2}' 2>/dev/null || echo "N/A")
        if [ "$cc2" != "N/A" ]; then
            increase=$(echo "scale=2; ($cc2 - $baseline_cc2) / $baseline_cc2 * 100" | bc 2>/dev/null || echo "calc_error")
            echo "    ${percent}% Sel: $increase%" >> $COMPARISON_REPORT
        fi
    done
    if [ "$legacy_cc2" != "N/A" ]; then
        leg_cc2_increase=$(echo "scale=2; ($legacy_cc2 - $baseline_cc2) / $baseline_cc2 * 100" | bc 2>/dev/null || echo "calc_error")
        echo "    Legacy:    $leg_cc2_increase%" >> $COMPARISON_REPORT
    fi
fi
echo "" >> $COMPARISON_REPORT

# CC3 Power (Conservative with Leakage)
baseline_cc3=$(grep -w "total_power_cycle_cc3" $BASELINE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")
legacy_cc3=$(grep -w "total_power_cycle_cc3" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "N/A")

echo "CC3 Power (Conservative with Leakage):" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_cc3 W" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    cc3=$(grep -w "total_power_cycle_cc3" $output_file | awk '{print $2}' 2>/dev/null || echo "N/A")
    echo "  ${percent}% Sel:  $cc3 W" >> $COMPARISON_REPORT
done
echo "  Legacy:    $legacy_cc3 W" >> $COMPARISON_REPORT

# Calculate percentage increases for CC3
if [ "$baseline_cc3" != "N/A" ]; then
    echo "  📈 Percentage increase vs Baseline:" >> $COMPARISON_REPORT
    for percent in "${PERCENTAGES[@]}"; do
        output_file="${selective_outputs[$percent]}"
        cc3=$(grep -w "total_power_cycle_cc3" $output_file | awk '{print $2}' 2>/dev/null || echo "N/A")
        if [ "$cc3" != "N/A" ]; then
            increase=$(echo "scale=2; $cc3 / $baseline_cc3 * 100" | bc 2>/dev/null || echo "calc_error")
            echo "    ${percent}% Sel: $increase%" >> $COMPARISON_REPORT
        fi
    done
    if [ "$legacy_cc3" != "N/A" ]; then
        leg_cc3_increase=$(echo "scale=2; $legacy_cc3 / $baseline_cc3 * 100" | bc 2>/dev/null || echo "calc_error")
        echo "    Legacy:    $leg_cc3_increase%" >> $COMPARISON_REPORT
    fi
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
    legacy_acc=$(grep "${cache}\.accesses" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "0")
    echo "  Accesses - Baseline: $baseline_acc, Legacy: $legacy_acc" >> $COMPARISON_REPORT
    for percent in "${PERCENTAGES[@]}"; do
        output_file="${selective_outputs[$percent]}"
        acc=$(grep "${cache}\.accesses" $output_file | awk '{print $2}' 2>/dev/null || echo "0")
        echo "           ${percent}% Sel: $acc" >> $COMPARISON_REPORT
    done
    
    # Miss rate
    baseline_miss=$(grep "${cache}\.miss_rate" $BASELINE_OUTPUT | awk '{print $2}' 2>/dev/null || echo "0")
    legacy_miss=$(grep "${cache}\.miss_rate" $LEGACY_OUTPUT | awk '{print $2}' 2>/dev/null || echo "0")
    echo "  Miss Rate - Baseline: $baseline_miss, Legacy: $legacy_miss" >> $COMPARISON_REPORT
    for percent in "${PERCENTAGES[@]}"; do
        output_file="${selective_outputs[$percent]}"
        miss=$(grep "${cache}\.miss_rate" $output_file | awk '{print $2}' 2>/dev/null || echo "0")
        echo "            ${percent}% Sel: $miss" >> $COMPARISON_REPORT
    done
    echo "" >> $COMPARISON_REPORT
done

# Functional Unit Usage Comparison
echo "Functional Unit Usage:" >> $COMPARISON_REPORT
echo "======================" >> $COMPARISON_REPORT

# Baseline Mode FU Usage
if grep -q "integer-ALU" $BASELINE_OUTPUT; then
    echo "Baseline Mode FU Usage:" >> $COMPARISON_REPORT
    grep "integer-ALU\|FP-adder\|FP-MULT" $BASELINE_OUTPUT | head -5 >> $COMPARISON_REPORT
    echo "" >> $COMPARISON_REPORT
else
    echo "Baseline Mode FU Usage:" >> $COMPARISON_REPORT
    echo "  No FU usage statistics found in baseline output" >> $COMPARISON_REPORT
    echo "" >> $COMPARISON_REPORT
fi

# Selective Modes FU Usage
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    if grep -q "integer-ALU" $output_file; then
        echo "Selective ${percent}% Mode FU Usage:" >> $COMPARISON_REPORT
        grep "integer-ALU\|FP-adder\|FP-MULT" $output_file | head -5 >> $COMPARISON_REPORT
        echo "" >> $COMPARISON_REPORT
    else
        echo "Selective ${percent}% Mode FU Usage:" >> $COMPARISON_REPORT
        echo "  No FU usage statistics found in ${percent}% selective output" >> $COMPARISON_REPORT
        echo "" >> $COMPARISON_REPORT
    fi
done

# Legacy Mode FU Usage
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
legacy_errors=$(grep -i "error\|assert\|panic\|abort" $LEGACY_OUTPUT | wc -l)

echo "Error/Warning Count:" >> $COMPARISON_REPORT
echo "  Baseline:  $baseline_errors" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    errors=$(grep -i "error\|assert\|panic\|abort" $output_file | wc -l)
    echo "  ${percent}% Sel:  $errors" >> $COMPARISON_REPORT
done
echo "  Legacy:    $legacy_errors" >> $COMPARISON_REPORT

# Calculate total errors
total_errors=$baseline_errors
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    errors=$(grep -i "error\|assert\|panic\|abort" $output_file | wc -l)
    total_errors=$((total_errors + errors))
done
total_errors=$((total_errors + legacy_errors))

if [ $total_errors -gt 0 ]; then
    echo "  ⚠️  Errors detected in simulation output" >> $COMPARISON_REPORT
    if [ $baseline_errors -gt 0 ]; then
        echo "  Baseline errors:" >> $COMPARISON_REPORT
        grep -i "error\|assert\|panic\|abort" $BASELINE_OUTPUT | head -3 >> $COMPARISON_REPORT
    fi
    for percent in "${PERCENTAGES[@]}"; do
        output_file="${selective_outputs[$percent]}"
        errors=$(grep -i "error\|assert\|panic\|abort" $output_file | wc -l)
        if [ $errors -gt 0 ]; then
            echo "  ${percent}% Selective errors:" >> $COMPARISON_REPORT
            grep -i "error\|assert\|panic\|abort" $output_file | head -3 >> $COMPARISON_REPORT
        fi
    done
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
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    echo "  ${percent}% Sel mode:  $output_file" >> $COMPARISON_REPORT
done
echo "  Legacy mode:    $LEGACY_OUTPUT" >> $COMPARISON_REPORT
echo "  This report:    $COMPARISON_REPORT" >> $COMPARISON_REPORT
echo "" >> $COMPARISON_REPORT
echo "Address files:" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    addr_file="addresses_${percent}percent.txt"
    echo "  ${percent}% addresses: $addr_file" >> $COMPARISON_REPORT
done
echo "" >> $COMPARISON_REPORT
echo "File sizes:" >> $COMPARISON_REPORT
echo "  Baseline output:  $(wc -l < $BASELINE_OUTPUT) lines, $(du -h $BASELINE_OUTPUT | cut -f1)" >> $COMPARISON_REPORT
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    echo "  ${percent}% Sel output:  $(wc -l < $output_file) lines, $(du -h $output_file | cut -f1)" >> $COMPARISON_REPORT
done
echo "  Legacy output:    $(wc -l < $LEGACY_OUTPUT) lines, $(du -h $LEGACY_OUTPUT | cut -f1)" >> $COMPARISON_REPORT

# Display the report
echo "Percentage-based comparison completed! Report generated in: $COMPARISON_REPORT"
echo ""
echo "=== QUICK SUMMARY (DYNAMIC POWER FOCUS) ==="
echo "CC1 Power (Aggressive):"
echo "  Baseline: $baseline_cc1 W"
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    cc1=$(grep "total_power_cycle_cc1" $output_file | awk '{print $2}' 2>/dev/null || echo "N/A")
    echo "  ${percent}% Sel: $cc1 W"
done
echo "  Legacy: $legacy_cc1 W"
echo ""
echo "CC2 Power (Proportional):"
echo "  Baseline: $baseline_cc2 W"
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    cc2=$(grep "total_power_cycle_cc2" $output_file | awk '{print $2}' 2>/dev/null || echo "N/A")
    echo "  ${percent}% Sel: $cc2 W"
done
echo "  Legacy: $legacy_cc2 W"
echo ""
echo "CC3 Power (Conservative):"
echo "  Baseline: $baseline_cc3 W"
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    cc3=$(grep "total_power_cycle_cc3" $output_file | awk '{print $2}' 2>/dev/null || echo "N/A")
    echo "  ${percent}% Sel: $cc3 W"
done
echo "  Legacy: $legacy_cc3 W"
echo ""
echo "Instructions Added in Rename:"
echo "  Baseline:  $baseline_added"
for percent in "${PERCENTAGES[@]}"; do
    output_file="${selective_outputs[$percent]}"
    added=$(grep "Total Number of Added Instrction in Rename" $output_file | awk '{print $NF}' 2>/dev/null || echo "0")
    echo "  ${percent}% Sel:  $added"
done
echo "  Legacy:    $legacy_added"
echo ""
echo "Address Files Created:"
for percent in "${PERCENTAGES[@]}"; do
    addr_file="addresses_${percent}percent.txt"
    if [ -f "$addr_file" ]; then
        addr_count=$(grep -v '^#' "$addr_file" | wc -l)
        echo "  ${percent}%: $addr_count addresses in $addr_file"
    fi
done
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
