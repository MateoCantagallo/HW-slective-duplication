#!/usr/bin/env python3
import re

# Test with the ammp data
test_lines = [
    "    5% Sel: 0%",
    "    10% Sel: 1.00%", 
    "    20% Sel: 2.00%",
    "    50% Sel: 8.00%",
    "    Legacy:    15.00%"
]

print("Testing CC3 AVG Power parsing:")
for line in test_lines:
    if '5% Sel:' in line:
        match = re.search(r'5% Sel:\s*(\d+\.?\d*)%', line)
        print(f"5% Sel line: '{line}' -> {match.group(1) if match else 'NO MATCH'}")
    elif '10% Sel:' in line:
        match = re.search(r'10% Sel:\s*(\d+\.?\d*)%', line)
        print(f"10% Sel line: '{line}' -> {match.group(1) if match else 'NO MATCH'}")
    elif '20% Sel:' in line:
        match = re.search(r'20% Sel:\s*(\d+\.?\d*)%', line)
        print(f"20% Sel line: '{line}' -> {match.group(1) if match else 'NO MATCH'}")
    elif '50% Sel:' in line:
        match = re.search(r'50% Sel:\s*(\d+\.?\d*)%', line)
        print(f"50% Sel line: '{line}' -> {match.group(1) if match else 'NO MATCH'}")
    elif 'Legacy:' in line:
        match = re.search(r'Legacy:\s*(-?\d+\.?\d*)%', line)
        print(f"Legacy line: '{line}' -> {match.group(1) if match else 'NO MATCH'}")
