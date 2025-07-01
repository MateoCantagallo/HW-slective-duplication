# Selective Instruction Duplication Feature

## Overview

This feature has been added to the MSim-C3 simulator to enable selective instruction duplication based on a list of instruction addresses provided via an external file. Instead of duplicating all instructions, the simulator now allows you to specify exactly which instructions should be duplicated and checked.

## Implementation Details

### New Components Added:

1. **Address List Management**:
   - `duplicate_addr_list`: Array to store addresses from the external file
   - `duplicate_addr_count`: Number of addresses loaded
   - `duplicate_addr_file`: Path to the address file (command line option)

2. **Functions**:
   - `load_duplicate_addresses()`: Loads addresses from the external file during simulator initialization
   - `should_duplicate_instruction(md_addr_t addr)`: Checks if an instruction at given address should be duplicated

3. **Command Line Option**:
   - `-duplicate:addr_file <filename>`: Specifies the file containing instruction addresses to duplicate

### How It Works:

1. **Initialization**: During simulator startup, `load_duplicate_addresses()` is called to read the address file
2. **Fetch Stage**: For each fetched instruction, the simulator checks if the instruction's PC is in the loaded address list
3. **Duplication Control**: 
   - If address is found: `insertInstToRename = 1` and `insertInstToExecute = 1` (duplication enabled)
   - If address not found: `insertInstToRename = 0` and `insertInstToExecute = 0` (duplication disabled)
4. **Pipeline Stages**: The existing GUL duplication code executes only for instructions with duplication enabled

### Usage:

```bash
# Run simulator with selective duplication
./sim-outorder -duplicate:addr_file addresses.txt [other options] program.exe

# Run simulator with all instructions duplicated (legacy behavior)
./sim-outorder [other options] program.exe
```

### Address File Format:

```
# Comment lines start with #
# One hexadecimal address per line (without 0x prefix)
400000
400004
400010
40001C
400020
```

### Benefits:

1. **Performance**: Only duplicate instructions that need checking, reducing overhead
2. **Flexibility**: Easy to modify which instructions are duplicated without recompiling
3. **Targeted Testing**: Focus duplication on specific critical instructions
4. **Backward Compatibility**: If no address file is specified, all instructions are duplicated (original behavior)

### Code Changes:

- **sim-outorder.c**: Added address management, command line option, and fetch stage logic
- Modified existing duplication control variables (`insertInstToRename`, `insertInstToExecute`) to be set dynamically during fetch

### Integration with Existing Code:

The new feature integrates seamlessly with the existing GUL duplication infrastructure:
- Rename stage: Checks `insertInstToRename` flag (line ~6018)
- Execute stage: Checks `insertInstToExecute` flag (lines ~4235, 4281)
- All existing duplication and checking logic remains unchanged

This implementation leverages the existing duplication control mechanism while adding the ability to selectively enable it based on instruction addresses.
