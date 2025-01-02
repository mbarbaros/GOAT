# 🧬 GOAT: Genomic Optimization Automation Tool

## Overview
GOAT is a Snakemake-based pipeline for bacterial genome assembly optimization, featuring automated k-mer sweeping for optimal assembly results.

## Features
- Automated quality control and read trimming
- Systematic k-mer sweep assembly using SPAdes
  - K-mer sizes: 21-127
  - Careful mode enabled
  - Individual assembly for each k-mer value
- Organized output structure for easy comparison
- Resource-aware computation

## Requirements
- Snakemake ≥7.0
- Python ≥3.8
- SPAdes ≥3.15.0
- FastQC
- BBMap (for BBDuk)
- MultiQC

## Quick Start

## Input Requirements
- Paired-end Illumina reads
- Files should be named:
  - R1.fastq.gz
  - R2.fastq.gz

## Output Structure

## Author
[mbarbaros](https://github.com/mbarbaros)

## License
MIT License