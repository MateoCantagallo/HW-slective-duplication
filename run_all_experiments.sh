#!/bin/bash

# Master script to run the complete experimental pipeline for all benchmarks
# This script will:
# 1. For each benchmark in args/ directory
# 2. Run sim-outorder-cont to generate dynamic instruction percentages JSON
# 3. Create address files for 5%, 10%, 20%, and 50% selective duplication
# 4. Run the comparison script and store results in results/benchmark_name/

echo "=== Master Experimental Pipeline Script ==="
echo ""

# Configuration
INST_COUNT=200000000  # Reduced for testing
ARGS_DIR="args"
CONT_SIMULATOR="./sim-outorder-cont"
COMPARISON_SCRIPT="./compare_duplication_modes.sh"

# Check prerequisites
if [ ! -f "$CONT_SIMULATOR" ]; then
    echo "ERROR: $CONT_SIMULATOR executable not found!"
    echo "Please ensure the counter simulator exists"
    exit 1
fi

if [ ! -f "$COMPARISON_SCRIPT" ]; then
    echo "ERROR: $COMPARISON_SCRIPT not found!"
    echo "Please ensure the comparison script exists"
    exit 1
fi

if [ ! -d "$ARGS_DIR" ]; then
    echo "ERROR: $ARGS_DIR directory not found!"
    echo "Please ensure the args directory exists"
    exit 1
fi

# Create main results directory
mkdir -p results
echo "Created main results directory"

# Function to extract benchmark name from .arg file
get_benchmark_name() {
    local arg_file="$1"
    basename "$arg_file" .arg
}

# Function to run instruction counting for a benchmark
run_instruction_counting() {
    local benchmark_name="$1"
    local arg_file="$2"
    local json_file="static_inst_profile_${benchmark_name}.json"
    
    echo "Running instruction counting for $benchmark_name..."
    echo "Command: $CONT_SIMULATOR -max:inst $INST_COUNT $arg_file"
    
    # Remove any existing JSON file to avoid confusion
    rm -f static_inst_profile.json
    
    # Run the counter simulator to generate JSON profile
    $CONT_SIMULATOR -config gulay "$arg_file" > "counting_${benchmark_name}_output.txt" 2>&1
    
    local exit_code=$?
    if [ $exit_code -ne 0 ]; then
        echo "ERROR: Instruction counting failed for $benchmark_name"
        return 1
    fi
    
    # Check if the default JSON file was created and rename it
    if [ ! -f "static_inst_profile.json" ]; then
        echo "ERROR: JSON profile file static_inst_profile.json was not created for $benchmark_name"
        return 1
    fi
    
    # Rename to benchmark-specific name
    mv "static_inst_profile.json" "$json_file"
    
    echo "✓ Instruction counting completed for $benchmark_name"
    echo "  JSON profile: $json_file"
    echo ""
    
    return 0
}

# Function to create percentage-based address files
create_address_files() {
    local benchmark_name="$1"
    local json_file="static_inst_profile_${benchmark_name}.json"
    local percentages=(5 10 20 50 100)
    
    echo "Creating address files for $benchmark_name..."
    
    for percent in "${percentages[@]}"; do
        local output_file="addresses_${benchmark_name}_${percent}percent.txt"
        
        echo "  Creating ${percent}% address file..."
        
        # Use Python to parse JSON and select addresses
        python3 << EOF > "$output_file"
import json
import sys

try:
    # Load the JSON file
    with open('$json_file', 'r') as f:
        data = json.load(f)
    
    # Sort addresses by percent value (highest first)
    sorted_addresses = sorted(data.items(), key=lambda x: x[1]['percent'], reverse=True)
    
    # Select addresses until we reach the target percentage
    target = $percent
    current_sum = 0.0
    selected_addresses = []
    
    if target == 100:
        # For 100%, include all addresses
        selected_addresses = [addr for addr, info in sorted_addresses]
    else:
        # For other percentages, select until target is reached
        for addr, info in sorted_addresses:
            if current_sum >= target:
                break
            selected_addresses.append(addr)
            current_sum += info['percent']
    
    # Write addresses (without comments and without 0x prefix)
    for addr in selected_addresses:
        # Remove 0x prefix if present
        clean_addr = addr.replace('0x', '') if addr.startswith('0x') else addr
        # Add leading 01 if not present (for full 64-bit address format)
        # Check if address needs the leading 01 prefix based on memory layout
        if len(clean_addr) == 8 and not clean_addr.startswith('01'):
            clean_addr = '01' + clean_addr
        elif len(clean_addr) == 9 and clean_addr.startswith('12'):
            # Address like 120026xxx should become 0120026xxx
            clean_addr = '0' + clean_addr
        print(clean_addr)
        
except Exception as e:
    print(f"Error processing JSON file: {e}", file=sys.stderr)
    sys.exit(1)
EOF

        if [ $? -eq 0 ]; then
            local addr_count=$(wc -l < "$output_file")
            echo "    ✓ Created $output_file with $addr_count addresses"
        else
            echo "    ❌ Failed to create $output_file"
            return 1
        fi
    done
    
    echo ""
    return 0
}

# Function to run comparison for a benchmark
run_comparison() {
    local benchmark_name="$1"
    local arg_file="$2"
    
    echo "Running comparison experiments for $benchmark_name..."
    
    # Temporarily modify the comparison script's configuration
    # We need to create a temporary version that uses the benchmark-specific files
    local temp_script="temp_compare_${benchmark_name}.sh"
    
    # Copy the original script and modify it for this benchmark
    cp "$COMPARISON_SCRIPT" "$temp_script"
    
    # Modify the temporary script to use benchmark-specific files
    sed -i "s|TEST_CONFIG=\"test.arg\"|TEST_CONFIG=\"$arg_file\"|" "$temp_script"
    sed -i "s|JSON_FILE=\"static_inst_profile.json\"|JSON_FILE=\"static_inst_profile_${benchmark_name}.json\"|" "$temp_script"
    sed -i "s|addresses_\\\${target_percent}percent.txt|addresses_${benchmark_name}_\\\${target_percent}percent.txt|g" "$temp_script"
    sed -i "s|addresses_\\\${percent}percent.txt|addresses_${benchmark_name}_\\\${percent}percent.txt|g" "$temp_script"
    
    # Run the modified comparison script
    chmod +x "$temp_script"
    ./"$temp_script" "$benchmark_name"
    
    local exit_code=$?
    
    # Clean up temporary script
    rm -f "$temp_script"
    
    if [ $exit_code -ne 0 ]; then
        echo "ERROR: Comparison failed for $benchmark_name"
        return 1
    fi
    
    echo "✓ Comparison completed for $benchmark_name"
    echo "  Results stored in: results/$benchmark_name/"
    echo ""
    
    return 0
}

# Function to clean up temporary files
cleanup_temp_files() {
    local benchmark_name="$1"
    
    echo "Cleaning up temporary files for $benchmark_name..."
    
    # Remove temporary counting output
    rm -f "counting_${benchmark_name}_output.txt"
    
    # Remove address files (they're copied to results directory)
    rm -f "addresses_${benchmark_name}_"*"percent.txt"
    
    # Remove the JSON file (it's no longer needed after comparison)
    rm -f "static_inst_profile_${benchmark_name}.json"
    
    # Remove any remaining address files from previous runs to prevent interference
    rm -f addresses_*percent.txt
    
    echo "✓ Cleanup completed for $benchmark_name"
    echo ""
}

# Function to clean up all address files before starting next benchmark
cleanup_address_files() {
    echo "Cleaning up all address files before next benchmark..."
    
    # Remove any address files that might interfere with the next benchmark
    rm -f addresses_*percent.txt
    rm -f addresses_*_*percent.txt
    
    echo "✓ Address files cleanup completed"
    echo ""
}

# Main experimental loop
echo "Starting experimental pipeline for all benchmarks..."
echo "Arguments directory: $ARGS_DIR"
echo "Instruction count: $INST_COUNT"
echo ""

total_benchmarks=0
successful_benchmarks=0
failed_benchmarks=()

# Count total benchmarks
for arg_file in "$ARGS_DIR"/*.arg; do
    if [ -f "$arg_file" ]; then
        ((total_benchmarks++))
    fi
done

echo "Found $total_benchmarks benchmark(s) to process"
echo ""

# Process each benchmark
for arg_file in "$ARGS_DIR"/*.arg; do
    if [ ! -f "$arg_file" ]; then
        continue
    fi
    
    benchmark_name=$(get_benchmark_name "$arg_file")
    
    echo "======================================="
    echo "Processing benchmark: $benchmark_name"
    echo "Argument file: $arg_file"
    echo "======================================="
    
    # Clean up any leftover address files from previous runs
    cleanup_address_files
    
    # Step 1: Run instruction counting
    if ! run_instruction_counting "$benchmark_name" "$arg_file"; then
        echo "❌ Failed at instruction counting step for $benchmark_name"
        failed_benchmarks+=("$benchmark_name")
        cleanup_address_files  # Clean up before continuing to next benchmark
        continue
    fi
    
    # Step 2: Create address files
    if ! create_address_files "$benchmark_name"; then
        echo "❌ Failed at address file creation step for $benchmark_name"
        failed_benchmarks+=("$benchmark_name")
        cleanup_address_files  # Clean up before continuing to next benchmark
        continue
    fi
    
    # Step 3: Run comparison experiments
    if ! run_comparison "$benchmark_name" "$arg_file"; then
        echo "❌ Failed at comparison step for $benchmark_name"
        failed_benchmarks+=("$benchmark_name")
        cleanup_address_files  # Clean up before continuing to next benchmark
        continue
    fi
    
    # Step 4: Clean up temporary files
    cleanup_temp_files "$benchmark_name"
    
    ((successful_benchmarks++))
    echo "✅ Successfully completed all steps for $benchmark_name"
    echo ""
done

# Final summary
echo "======================================="
echo "EXPERIMENTAL PIPELINE SUMMARY"
echo "======================================="
echo "Total benchmarks processed: $total_benchmarks"
echo "Successful experiments: $successful_benchmarks"
echo "Failed experiments: $((total_benchmarks - successful_benchmarks))"

if [ ${#failed_benchmarks[@]} -gt 0 ]; then
    echo ""
    echo "Failed benchmarks:"
    for benchmark in "${failed_benchmarks[@]}"; do
        echo "  - $benchmark"
    done
fi

echo ""
echo "Results are stored in the results/ directory, organized by benchmark name."
echo ""

if [ $successful_benchmarks -eq $total_benchmarks ]; then
    echo "🎉 All experiments completed successfully!"
    exit 0
else
    echo "⚠️  Some experiments failed. Check the output above for details."
    exit 1
fi
