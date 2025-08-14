#!/bin/bash

# Simple comparison script to test duplication modes
# Usage: ./simple_test.sh <benchmark_arg_file>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <benchmark.arg>"
    echo "Example: $0 args/ammp.arg"
    exit 1
fi

ARG_FILE="$1"
BENCHMARK=$(basename "$ARG_FILE" .arg)

echo "======================================================================"
echo "  SIMPLE DUPLICATION MODE TEST"
echo "======================================================================"
echo "Benchmark: $BENCHMARK"
echo "Argument file: $ARG_FILE"
echo "======================================================================"

# Create empty address file for testing
EMPTY_ADDR_FILE="addresses_${BENCHMARK}_empty.txt"
touch "$EMPTY_ADDR_FILE"

# Test 1: Baseline (no duplication)
echo ""
echo "1. Running baseline (sim-outorder-none)..."
./sim-outorder-none -config gulay "$ARG_FILE" > baseline_test.txt 2>&1
if [ $? -eq 0 ]; then
    baseline_cycles=$(grep "sim_cycle" baseline_test.txt | awk '{print $2}')
    baseline_added=$(grep "Total Number of Added Instrction in Rename" baseline_test.txt | awk '{print $9}')
    baseline_avg_power=$(grep "avg_total_power_cycle_cc3" baseline_test.txt | awk '{print $2}')
    baseline_total_power=$(grep "total_power_cycle_cc3" baseline_test.txt | awk '{print $2}')
    
    # Handle case where baseline doesn't report instructions added (sim-outorder-none)
    if [ -z "$baseline_added" ]; then
        baseline_added="N/A"
    fi
    
    echo "   ✓ Baseline: $baseline_cycles cycles, $baseline_added instructions added"
    echo "              Avg CC3 power: $baseline_avg_power W, Total CC3 power: $baseline_total_power W"
else
    echo "   ❌ Baseline failed"
    exit 1
fi

# Test 2: Selective with empty address file (should duplicate nothing)
echo ""
echo "2. Running selective with empty address file..."
./sim-outordersel -config gulay -duplicate:addr_file "$EMPTY_ADDR_FILE" "$ARG_FILE" > selective_empty_test.txt 2>&1
if [ $? -eq 0 ]; then
    empty_cycles=$(grep "sim_cycle" selective_empty_test.txt | awk '{print $2}')
    empty_added=$(grep "Total Number of Added Instrction in Rename" selective_empty_test.txt | awk '{print $9}')
    empty_avg_power=$(grep "avg_total_power_cycle_cc3" selective_empty_test.txt | awk '{print $2}')
    empty_total_power=$(grep "total_power_cycle_cc3" selective_empty_test.txt | awk '{print $2}')
    echo "   ✓ Selective (empty): $empty_cycles cycles, $empty_added instructions added"
    echo "                        Avg CC3 power: $empty_avg_power W, Total CC3 power: $empty_total_power W"
else
    echo "   ❌ Selective (empty) failed"
    exit 1
fi



echo ""
echo "======================================================================"
echo "  RESULTS SUMMARY"
echo "======================================================================"
echo "Mode                    | Cycles      | Instructions Added | Avg CC3 Power (W) | Total CC3 Power (W)"
echo "------------------------|-------------|--------------------|--------------------|--------------------"
printf "%-23s | %-11s | %-18s | %-18s | %s\n" "Baseline (none)" "$baseline_cycles" "$baseline_added" "$baseline_avg_power" "$baseline_total_power"
printf "%-23s | %-11s | %-18s | %-18s | %s\n" "Selective (empty file)" "$empty_cycles" "$empty_added" "$empty_avg_power" "$empty_total_power"
echo "======================================================================"

# Analysis
echo ""
echo "ANALYSIS:"
echo "- Both modes should have similar cycles, 0 added instructions, and similar power"
echo "- If selective mode shows higher power, it indicates implementation differences"

if [ "$baseline_added" = "N/A" ] && [ "$empty_added" = "0" ]; then
    echo "✓ PASS: Baseline (N/A) and selective (0) show no duplication"
elif [ "$baseline_added" = "0" ] && [ "$empty_added" = "0" ]; then
    echo "✓ PASS: Both modes show no duplication (0 instructions added)"
else
    echo "❌ FAIL: Expected no duplication for both modes (got baseline: $baseline_added, selective: $empty_added)"
fi

# Calculate power differences
if [ -n "$baseline_avg_power" ] && [ -n "$empty_avg_power" ]; then
    avg_power_diff=$(echo "scale=4; $empty_avg_power - $baseline_avg_power" | bc -l)
    avg_power_pct=$(echo "scale=2; ($empty_avg_power - $baseline_avg_power) / $baseline_avg_power * 100" | bc -l)
    echo "Average power difference: ${avg_power_diff} W (${avg_power_pct}%)"
fi

if [ -n "$baseline_total_power" ] && [ -n "$empty_total_power" ]; then
    total_power_diff=$(echo "scale=4; $empty_total_power - $baseline_total_power" | bc -l)
    total_power_pct=$(echo "scale=2; ($empty_total_power - $baseline_total_power) / $baseline_total_power * 100" | bc -l)
    echo "Total power difference: ${total_power_diff} W (${total_power_pct}%)"
    
    # Check if power difference is significant (>1%)
    significant=$(echo "$total_power_pct > 1.0 || $total_power_pct < -1.0" | bc -l)
    if [ "$significant" = "1" ]; then
        echo "⚠️  WARNING: Significant total power difference detected between simulators"
    else
        echo "✓ PASS: Total power consumption is similar between simulators"
    fi
fi

# Cleanup
rm -f baseline_test.txt selective_empty_test.txt "$EMPTY_ADDR_FILE"

echo ""
echo "Test complete!"
