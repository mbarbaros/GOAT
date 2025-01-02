configfile: "config/config.yaml"

# Include rules
include: "workflow/rules/qc.smk"
include: "workflow/rules/trimming.smk"
include: "workflow/rules/assembly.smk"

# Define target rules
rule all:
    input:
        # QC and trimming outputs
        "results/qc/fastqc/raw/R1_fastqc.html",
        "results/qc/fastqc/raw/R2_fastqc.html",
        "results/trimmed/R1.trim.fastq.gz",
        "results/trimmed/R2.trim.fastq.gz",
        "results/qc/multiqc/multiqc_report.html",
        # Assembly outputs for all k-mers
        expand("results/assembly/k{kmer}/scaffolds.fasta",
               kmer=config["spades"]["kmers"])
