#!/bin/bash

# Test script for selective instruction duplication feature
# This script tests the new functionality added to sim-outorder

echo "=== Testing Selective Instruction Duplication Feature ==="
echo ""

# Check if sim-outorder exists
if [ ! -f "./sim-outorder" ]; then
    echo "ERROR: sim-outorder executable not found!"
    echo "Please compile the simulator first with 'make'"
    exit 1
fi

# Create a test address file if it doesn't exist
if [ ! -f "test_addresses.txt" ]; then
    cat > test_addresses.txt << EOF
# Test addresses for selective duplication
# These are example addresses - replace with actual instruction addresses from your program
400000
400004
400008
40000C
400010
EOF
fi

echo "Test address file created: test_addresses.txt"
echo "Contents:"
cat test_addresses.txt
echo ""

# Test 1: Check help output for new option
echo "=== Test 1: Checking if new command line option is available ==="
if ./sim-outorder -h 2>&1 | grep -q "duplicate:addr_file"; then
    echo "✓ PASS: -duplicate:addr_file option is available"
else
    echo "✗ FAIL: -duplicate:addr_file option not found in help"
fi
echo ""

# Test 2: Run with address file (testing with test.arg configuration)
echo "=== Test 2: Testing with address file using test.arg ==="
if [ -f "./test.arg" ]; then
    echo "Running: ./sim-outorder -duplicate:addr_file test_addresses.txt -max:inst 100000 test.arg"
    echo "Expected: Should see message about loading addresses and only duplicate specified instructions"
    echo ""
    ./sim-outorder -duplicate:addr_file test_addresses.txt -max:inst 100000 test.arg 2>&1 | head -20
    echo ""
    echo "✓ Test completed - check output above for selective duplication messages"
else
    echo "✗ test.arg not found - cannot test with actual program"
fi
echo ""

# Test 3: Run without address file (should work like before)
echo "=== Test 3: Testing without address file (legacy mode) ==="
if [ -f "./test.arg" ]; then
    echo "Running: ./sim-outorder -max:inst 100000 test.arg (without selective duplication)"
    echo "Expected: Should duplicate all instructions (original behavior)"
    echo ""
    ./sim-outorder -max:inst 100000 test.arg 2>&1 | head -15
    echo ""
    echo "✓ Legacy mode test completed"
else
    echo "✗ test.arg not found - cannot test legacy mode"
fi
echo ""

echo "=== Expected Behavior ==="
echo "1. With -duplicate:addr_file: Only instructions at specified addresses should be duplicated"
echo "2. Without -duplicate:addr_file: All instructions should be duplicated (original behavior)"
echo "3. You should see a message like: 'Loaded X addresses for selective duplication from 'filename''"
echo ""

echo "=== Manual Testing Instructions ==="
echo "1. Copy this script and test files to your clean directory: /home/mateo/Investigacion/Tesis/duplicador"
echo "2. Run: chmod +x test_selective_duplication.sh"
echo "3. Run: ./test_selective_duplication.sh"
echo "4. Test with an actual Alpha binary program"
echo ""

echo "Test files created. Copy to your clean directory and run the tests there."
