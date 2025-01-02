configfile: "config/config.yaml"

# Include rules
include: "workflow/rules/qc.smk"
include: "workflow/rules/trimming.smk"

# Define target rules
rule all:
    input:
        expand("results/qc/fastqc/raw/{sample}_{read}_fastqc.html",
               sample=config["samples"], read=["R1", "R2"]),
        expand("results/trimmed/{sample}_{read}.trim.fastq.gz",
               sample=config["samples"], read=["R1", "R2"]),
        "results/qc/multiqc/multiqc_report.html"
