#!/bin/bash

# Quick comparison script (non-interactive version for testing)
echo "Running quick comparison between duplication modes..."

# Run the main comparison script with automatic 'no' to viewing report
echo "n" | ./compare_duplication_modes.sh

echo ""
echo "Quick comparison completed. Key files generated:"
echo "  - legacy_output.txt (full duplication mode output)"
echo "  - selective_output.txt (selective duplication mode output)" 
echo "  - comparison_report.txt (detailed comparison)"
echo ""
echo "To view the detailed report:"
echo "  less comparison_report.txt"
echo ""
echo "To view quick summary:"
echo "  tail -20 comparison_report.txt"
