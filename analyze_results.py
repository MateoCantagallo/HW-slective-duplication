#!/usr/bin/env python3
"""
Analyze and visualize SimpleScalar duplication mode comparison results.
Parses comparison_report.txt files from all benchmarks and generates graphs.
"""

import os
import re
import json
import matplotlib.pyplot as plt
import pandas as pd
from pathlib import Path
import numpy as np
from typing import Dict, List, Tuple, Optional

class ResultsAnalyzer:
    def __init__(self, results_dir: str = "results"):
        self.results_dir = Path(results_dir)
        self.graphs_dir = Path("graphs")
        self.data = {}
        
        # Create graphs directory
        self.graphs_dir.mkdir(exist_ok=True)
        
    def parse_report(self, report_path: Path) -> Optional[Dict]:
        """Parse a single comparison_report.txt file."""
        try:
            with open(report_path, 'r') as f:
                content = f.read()
        except FileNotFoundError:
            print(f"Warning: {report_path} not found")
            return None
        except Exception as e:
            print(f"Error reading {report_path}: {e}")
            return None
            
        data = {
            'benchmark': report_path.parent.name,
            'ipc': {},
            'cc3_power_pct': {},
            'cc3_avg_power_pct': {},
            'fp_adder_busy': {}
        }
        
        try:
            # Parse IPC values
            ipc_section = re.search(r'Instructions Per Cycle \(IPC\):(.*?)(?=\n\n|\nDuplication Statistics)', content, re.DOTALL)
            if ipc_section:
                ipc_text = ipc_section.group(1)
                for line in ipc_text.strip().split('\n'):
                    if 'Baseline:' in line:
                        match = re.search(r'Baseline:\s*(\d+\.?\d*)', line)
                        if match:
                            data['ipc']['baseline'] = float(match.group(1))
                    elif '5% Sel:' in line:
                        match = re.search(r'5% Sel:\s*(\d+\.?\d*)', line)
                        if match:
                            data['ipc']['5%'] = float(match.group(1))
                    elif '10% Sel:' in line:
                        match = re.search(r'10% Sel:\s*(\d+\.?\d*)', line)
                        if match:
                            data['ipc']['10%'] = float(match.group(1))
                    elif '20% Sel:' in line:
                        match = re.search(r'20% Sel:\s*(\d+\.?\d*)', line)
                        if match:
                            data['ipc']['20%'] = float(match.group(1))
                    elif '50% Sel:' in line:
                        match = re.search(r'50% Sel:\s*(\d+\.?\d*)', line)
                        if match:
                            data['ipc']['50%'] = float(match.group(1))
                    elif 'Legacy:' in line:
                        match = re.search(r'Legacy:\s*(\d+\.?\d*)', line)
                        if match:
                            data['ipc']['legacy'] = float(match.group(1))
        except Exception as e:
            print(f"Error parsing IPC section for {report_path.parent.name}: {e}")
            print(f"Content: {content[:500]}...")  # Show first 500 chars for debugging
        
        try:
            # Parse CC3 Power percentage increases
            cc3_section = re.search(r'CC3 Power \(Conservative with Leakage\):(.*?)📈 Percentage increase vs Baseline:(.*?)(?=\n\nAVG CC3)', content, re.DOTALL)
            if cc3_section:
                pct_text = cc3_section.group(2)
                for line in pct_text.strip().split('\n'):
                    if '5% Sel:' in line:
                        match = re.search(r'5% Sel:\s*(\d+\.?\d*)%', line)
                        data['cc3_power_pct']['5%'] = float(match.group(1)) if match else 0.0
                    elif '10% Sel:' in line:
                        match = re.search(r'10% Sel:\s*(\d+\.?\d*)%', line)
                        data['cc3_power_pct']['10%'] = float(match.group(1)) if match else 0.0
                    elif '20% Sel:' in line:
                        match = re.search(r'20% Sel:\s*(\d+\.?\d*)%', line)
                        data['cc3_power_pct']['20%'] = float(match.group(1)) if match else 0.0
                    elif '50% Sel:' in line:
                        match = re.search(r'50% Sel:\s*(\d+\.?\d*)%', line)
                        data['cc3_power_pct']['50%'] = float(match.group(1)) if match else 0.0
                    elif 'Legacy:' in line:
                        match = re.search(r'Legacy:\s*(\d+\.?\d*)%', line)
                        data['cc3_power_pct']['legacy'] = float(match.group(1)) if match else 0.0
        except Exception as e:
            print(f"Error parsing CC3 power section for {report_path.parent.name}: {e}")
        
        try:
            # Parse AVG CC3 Power percentage increases  
            avg_cc3_section = re.search(r'AVG CC3 Power \(Conservative with Leakage\):(.*?)📈 Percentage increase vs Baseline:(.*?)(?=\n\nPower Model)', content, re.DOTALL)
            if avg_cc3_section:
                pct_text = avg_cc3_section.group(2)
                for line in pct_text.strip().split('\n'):
                    if '5% Sel:' in line:
                        match = re.search(r'5% Sel:\s*(\d+\.?\d*)%', line)
                        data['cc3_avg_power_pct']['5%'] = float(match.group(1)) if match else 0.0
                    elif '10% Sel:' in line:
                        match = re.search(r'10% Sel:\s*(\d+\.?\d*)%', line)
                        data['cc3_avg_power_pct']['10%'] = float(match.group(1)) if match else 0.0
                    elif '20% Sel:' in line:
                        match = re.search(r'20% Sel:\s*(\d+\.?\d*)%', line)
                        data['cc3_avg_power_pct']['20%'] = float(match.group(1)) if match else 0.0
                    elif '50% Sel:' in line:
                        match = re.search(r'50% Sel:\s*(\d+\.?\d*)%', line)
                        data['cc3_avg_power_pct']['50%'] = float(match.group(1)) if match else 0.0
                    elif 'Legacy:' in line:
                        match = re.search(r'Legacy:\s*(-?\d+\.?\d*)%', line)
                        data['cc3_avg_power_pct']['legacy'] = float(match.group(1)) if match else 0.0
        except Exception as e:
            print(f"Error parsing AVG CC3 power section for {report_path.parent.name}: {e}")
        
        try:
            # Parse FP-adder busy cycles
            fp_adder_sections = re.findall(r'(Selective \d+% Mode|Legacy Mode|Baseline Mode) FU Usage:(.*?)(?=\n\n|\nSelective|\nLegacy|\nError)', content, re.DOTALL)
            
            for mode_match, fu_text in fp_adder_sections:
                fp_match = re.search(r'FP-adder \(busy for (\d+) cycles', fu_text)
                if fp_match:
                    busy_cycles = int(fp_match.group(1))
                    if 'Selective 5%' in mode_match:
                        data['fp_adder_busy']['5%'] = busy_cycles
                    elif 'Selective 10%' in mode_match:
                        data['fp_adder_busy']['10%'] = busy_cycles
                    elif 'Selective 20%' in mode_match:
                        data['fp_adder_busy']['20%'] = busy_cycles
                    elif 'Selective 50%' in mode_match:
                        data['fp_adder_busy']['50%'] = busy_cycles
                    elif 'Legacy' in mode_match:
                        data['fp_adder_busy']['legacy'] = busy_cycles
                    elif 'Baseline' in mode_match:
                        data['fp_adder_busy']['baseline'] = busy_cycles
        except Exception as e:
            print(f"Error parsing FP-adder section for {report_path.parent.name}: {e}")
        
        return data
    
    def load_all_data(self):
        """Load data from all benchmark reports."""
        benchmarks = [d for d in self.results_dir.iterdir() if d.is_dir() and d.name != 'test_run']
        
        for benchmark_dir in benchmarks:
            report_path = benchmark_dir / "comparison_report.txt"
            data = self.parse_report(report_path)
            if data:
                self.data[data['benchmark']] = data
                print(f"✓ Loaded data for {data['benchmark']}")
            else:
                print(f"✗ Failed to load data for {benchmark_dir.name}")
    
    def create_individual_graphs(self):
        """Create individual graphs for each benchmark."""
        print("\nCreating individual benchmark graphs...")
        
        for benchmark, data in self.data.items():
            fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 12))
            fig.suptitle(f'{benchmark.upper()} - Performance and Power Analysis', fontsize=16, fontweight='bold')
            
            # IPC Graph
            if data['ipc']:
                modes = list(data['ipc'].keys())
                values = list(data['ipc'].values())
                colors = ['blue', 'green', 'orange', 'red', 'purple', 'brown'][:len(modes)]
                
                bars1 = ax1.bar(modes, values, color=colors, alpha=0.7)
                ax1.set_title('Instructions Per Cycle (IPC)', fontweight='bold')
                ax1.set_ylabel('IPC')
                ax1.tick_params(axis='x', rotation=45)
                ax1.grid(axis='y', alpha=0.3)
                
                # Add value labels on bars
                for bar, value in zip(bars1, values):
                    ax1.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.01,
                            f'{value:.3f}', ha='center', va='bottom', fontweight='bold')
            
            # CC3 Power Percentage Increase
            if data['cc3_power_pct']:
                modes = [k for k in data['cc3_power_pct'].keys() if k != 'baseline']
                values = [data['cc3_power_pct'][k] for k in modes]
                colors = ['green', 'orange', 'red', 'purple', 'brown'][:len(modes)]
                
                bars2 = ax2.bar(modes, values, color=colors, alpha=0.7)
                ax2.set_title('CC3 Power % Increase vs Baseline', fontweight='bold')
                ax2.set_ylabel('Power Increase (%)')
                ax2.tick_params(axis='x', rotation=45)
                ax2.grid(axis='y', alpha=0.3)
                
                for bar, value in zip(bars2, values):
                    ax2.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.5,
                            f'{value:.0f}%', ha='center', va='bottom', fontweight='bold')
            
            # CC3 Average Power Percentage Increase
            if data['cc3_avg_power_pct']:
                modes = [k for k in data['cc3_avg_power_pct'].keys() if k != 'baseline']
                values = [data['cc3_avg_power_pct'][k] for k in modes]
                colors = ['green', 'orange', 'red', 'purple', 'brown'][:len(modes)]
                
                bars3 = ax3.bar(modes, values, color=colors, alpha=0.7)
                ax3.set_title('CC3 Avg Power % Increase vs Baseline', fontweight='bold')
                ax3.set_ylabel('Avg Power Increase (%)')
                ax3.tick_params(axis='x', rotation=45)
                ax3.grid(axis='y', alpha=0.3)
                
                for bar, value in zip(bars3, values):
                    ax3.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.1,
                            f'{value:.1f}%', ha='center', va='bottom', fontweight='bold')
            
            # FP-Adder Busy Cycles
            if data['fp_adder_busy']:
                modes = list(data['fp_adder_busy'].keys())
                values = [data['fp_adder_busy'][k] / 1000000 for k in modes]  # Convert to millions
                colors = ['blue', 'green', 'orange', 'red', 'purple', 'brown'][:len(modes)]
                
                bars4 = ax4.bar(modes, values, color=colors, alpha=0.7)
                ax4.set_title('FP-Adder Busy Cycles (Millions)', fontweight='bold')
                ax4.set_ylabel('Busy Cycles (M)')
                ax4.tick_params(axis='x', rotation=45)
                ax4.grid(axis='y', alpha=0.3)
                
                for bar, value in zip(bars4, values):
                    ax4.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.2,
                            f'{value:.1f}M', ha='center', va='bottom', fontweight='bold')
            
            plt.tight_layout()
            output_path = self.graphs_dir / f"{benchmark}_analysis.png"
            plt.savefig(output_path, dpi=300, bbox_inches='tight')
            plt.close()
            print(f"  ✓ Saved {output_path}")
    
    def create_aggregate_graphs(self):
        """Create aggregate graphs showing all benchmarks together."""
        print("\nCreating aggregate comparison graphs...")
        
        # Prepare data for aggregate plots
        benchmarks = list(self.data.keys())
        benchmarks.sort()  # Sort for consistent ordering
        
        # Add "Average" to the list of benchmarks for display
        benchmarks_with_avg = benchmarks + ['Average']
        
        # IPC Aggregate Graph
        fig, ax = plt.subplots(figsize=(18, 10))
        
        modes = ['baseline', '5%', '10%', '20%', '50%', 'legacy']
        mode_colors = {'baseline': 'blue', '5%': 'green', '10%': 'orange', 
                      '20%': 'red', '50%': 'purple', 'legacy': 'brown'}
        
        x = np.arange(len(benchmarks_with_avg))
        width = 0.12
        
        for i, mode in enumerate(modes):
            values = []
            mode_values = []
            
            # Collect values for all benchmarks
            for benchmark in benchmarks:
                if mode in self.data[benchmark]['ipc']:
                    value = self.data[benchmark]['ipc'][mode]
                    values.append(value)
                    mode_values.append(value)
                else:
                    values.append(0)
            
            # Calculate average (only for non-zero values)
            avg_value = np.mean([v for v in mode_values if v > 0]) if mode_values else 0
            values.append(avg_value)
            
            offset = (i - len(modes)/2) * width + width/2
            bars = ax.bar(x + offset, values, width, label=mode, color=mode_colors[mode], alpha=0.8)
            
            # Highlight the average bar with a border
            bars[-1].set_edgecolor('black')
            bars[-1].set_linewidth(2)
        
        ax.set_xlabel('Benchmarks', fontweight='bold')
        ax.set_ylabel('Instructions Per Cycle (IPC)', fontweight='bold')
        ax.set_title('IPC Comparison Across All Benchmarks (with Average)', fontsize=16, fontweight='bold')
        ax.set_xticks(x)
        ax.set_xticklabels(benchmarks_with_avg, rotation=45, ha='right')
        ax.legend()
        ax.grid(axis='y', alpha=0.3)
        
        # Add a vertical line to separate benchmarks from average
        ax.axvline(x=len(benchmarks) - 0.5, color='gray', linestyle='--', alpha=0.7)
        
        plt.tight_layout()
        plt.savefig(self.graphs_dir / "all_benchmarks_ipc.png", dpi=300, bbox_inches='tight')
        plt.close()
        print("  ✓ Saved all_benchmarks_ipc.png")
        
        # CC3 Power Percentage Increase Aggregate Graph
        fig, ax = plt.subplots(figsize=(18, 10))
        
        selective_modes = ['5%', '10%', '20%', '50%', 'legacy']
        
        for i, mode in enumerate(selective_modes):
            values = []
            mode_values = []
            
            # Collect values for all benchmarks
            for benchmark in benchmarks:
                if mode in self.data[benchmark]['cc3_power_pct']:
                    value = self.data[benchmark]['cc3_power_pct'][mode]
                    values.append(value)
                    mode_values.append(value)
                else:
                    values.append(0)
            
            # Calculate average (only for non-zero values)
            avg_value = np.mean([v for v in mode_values if v > 0]) if mode_values else 0
            values.append(avg_value)
            
            offset = (i - len(selective_modes)/2) * width * 1.2 + width/2
            bars = ax.bar(x + offset, values, width * 1.2, label=mode, color=mode_colors[mode], alpha=0.8)
            
            # Highlight the average bar with a border
            bars[-1].set_edgecolor('black')
            bars[-1].set_linewidth(2)
        
        ax.set_xlabel('Benchmarks', fontweight='bold')
        ax.set_ylabel('Power Increase (%)', fontweight='bold')
        ax.set_title('CC3 Power % Increase vs Baseline - All Benchmarks (with Average)', fontsize=16, fontweight='bold')
        ax.set_xticks(x)
        ax.set_xticklabels(benchmarks_with_avg, rotation=45, ha='right')
        ax.legend()
        ax.grid(axis='y', alpha=0.3)
        
        # Add a vertical line to separate benchmarks from average
        ax.axvline(x=len(benchmarks) - 0.5, color='gray', linestyle='--', alpha=0.7)
        
        plt.tight_layout()
        plt.savefig(self.graphs_dir / "all_benchmarks_cc3_power.png", dpi=300, bbox_inches='tight')
        plt.close()
        print("  ✓ Saved all_benchmarks_cc3_power.png")
        
        # CC3 Average Power Percentage Increase Aggregate Graph
        fig, ax = plt.subplots(figsize=(18, 10))
        
        for i, mode in enumerate(selective_modes):
            values = []
            mode_values = []
            
            # Collect values for all benchmarks
            for benchmark in benchmarks:
                if mode in self.data[benchmark]['cc3_avg_power_pct']:
                    value = self.data[benchmark]['cc3_avg_power_pct'][mode]
                    values.append(value)
                    mode_values.append(value)
                else:
                    values.append(0)
            
            # Calculate average (only for non-zero values)
            avg_value = np.mean([v for v in mode_values if v > 0]) if mode_values else 0
            values.append(avg_value)
            
            offset = (i - len(selective_modes)/2) * width * 1.2 + width/2
            bars = ax.bar(x + offset, values, width * 1.2, label=mode, color=mode_colors[mode], alpha=0.8)
            
            # Highlight the average bar with a border
            bars[-1].set_edgecolor('black')
            bars[-1].set_linewidth(2)
        
        ax.set_xlabel('Benchmarks', fontweight='bold')
        ax.set_ylabel('Avg Power Increase (%)', fontweight='bold')
        ax.set_title('CC3 Avg Power % Increase vs Baseline - All Benchmarks (with Average)', fontsize=16, fontweight='bold')
        ax.set_xticks(x)
        ax.set_xticklabels(benchmarks_with_avg, rotation=45, ha='right')
        ax.legend()
        ax.grid(axis='y', alpha=0.3)
        
        # Add a vertical line to separate benchmarks from average
        ax.axvline(x=len(benchmarks) - 0.5, color='gray', linestyle='--', alpha=0.7)
        
        plt.tight_layout()
        plt.savefig(self.graphs_dir / "all_benchmarks_cc3_avg_power.png", dpi=300, bbox_inches='tight')
        plt.close()
        print("  ✓ Saved all_benchmarks_cc3_avg_power.png")
        
        # FP-Adder Busy Cycles Aggregate Graph
        fig, ax = plt.subplots(figsize=(18, 10))
        
        all_modes = ['baseline', '5%', '10%', '20%', '50%', 'legacy']
        
        for i, mode in enumerate(all_modes):
            values = []
            mode_values = []
            
            # Collect values for all benchmarks
            for benchmark in benchmarks:
                if mode in self.data[benchmark]['fp_adder_busy']:
                    value = self.data[benchmark]['fp_adder_busy'][mode] / 1000000  # Convert to millions
                    values.append(value)
                    mode_values.append(value)
                else:
                    values.append(0)
            
            # Calculate average (only for non-zero values)
            avg_value = np.mean([v for v in mode_values if v > 0]) if mode_values else 0
            values.append(avg_value)
            
            offset = (i - len(all_modes)/2) * width + width/2
            bars = ax.bar(x + offset, values, width, label=mode, color=mode_colors[mode], alpha=0.8)
            
            # Highlight the average bar with a border
            bars[-1].set_edgecolor('black')
            bars[-1].set_linewidth(2)
        
        ax.set_xlabel('Benchmarks', fontweight='bold')
        ax.set_ylabel('FP-Adder Busy Cycles (Millions)', fontweight='bold')
        ax.set_title('FP-Adder Busy Cycles - All Benchmarks (with Average)', fontsize=16, fontweight='bold')
        ax.set_xticks(x)
        ax.set_xticklabels(benchmarks_with_avg, rotation=45, ha='right')
        ax.legend()
        ax.grid(axis='y', alpha=0.3)
        
        # Add a vertical line to separate benchmarks from average
        ax.axvline(x=len(benchmarks) - 0.5, color='gray', linestyle='--', alpha=0.7)
        
        plt.tight_layout()
        plt.savefig(self.graphs_dir / "all_benchmarks_fp_adder.png", dpi=300, bbox_inches='tight')
        plt.close()
        print("  ✓ Saved all_benchmarks_fp_adder.png")
    
    def export_data_summary(self):
        """Export a summary of all parsed data to JSON."""
        summary_path = self.graphs_dir / "data_summary.json"
        with open(summary_path, 'w') as f:
            json.dump(self.data, f, indent=2)
        print(f"  ✓ Exported data summary to {summary_path}")
    
    def run_analysis(self):
        """Run the complete analysis pipeline."""
        print("🔍 Starting SimpleScalar Results Analysis...")
        print("=" * 60)
        
        # Load all data
        self.load_all_data()
        
        if not self.data:
            print("❌ No data loaded. Check that comparison_report.txt files exist in results directories.")
            return
        
        print(f"\n📊 Loaded data from {len(self.data)} benchmarks:")
        for benchmark in sorted(self.data.keys()):
            print(f"  • {benchmark}")
        
        # Create visualizations
        self.create_individual_graphs()
        self.create_aggregate_graphs()
        self.export_data_summary()
        
        print("\n" + "=" * 60)
        print("✅ Analysis complete!")
        print(f"📈 Graphs saved in: {self.graphs_dir.absolute()}")
        print(f"📋 Data summary: {self.graphs_dir.absolute()}/data_summary.json")

def main():
    analyzer = ResultsAnalyzer()
    analyzer.run_analysis()

if __name__ == "__main__":
    main()
