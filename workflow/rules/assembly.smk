rule spades_single_kmer:
    input:
        r1 = "results/trimmed/{sample}_R1.trim.fastq.gz",
        r2 = "results/trimmed/{sample}_R2.trim.fastq.gz"
    output:
        scaffolds = "results/assembly/spades/{sample}/k{kmer}/k{kmer}_scaffolds.fasta",
        dir = directory("results/assembly/spades/{sample}/k{kmer}")
    log:
        "logs/spades/{sample}_k{kmer}.log"
    params:
        mode = config["spades"]["mode"],
        tmp_dir = directory("results/assembly/tmp/{sample}_k{wildcards.kmer}")
    threads: config["spades"]["threads"]
    resources:
        mem_gb = config["spades"]["memory"]
    shell:
        """
        # Create temporary directory
        mkdir -p {params.tmp_dir}
        
        # Run SPAdes with single k-mer
        spades.py \
            -1 {input.r1} \
            -2 {input.r2} \
            -o {output.dir} \
            --careful \
            -k {wildcards.kmer} \
            -t {threads} \
            -m $(({resources.mem_gb})) \
            --tmp-dir {params.tmp_dir} \
            2> {log}
            
        # Rename scaffolds file
        mv {output.dir}/scaffolds.fasta {output.scaffolds}
        
        # Clean up temporary directory
        rm -rf {params.tmp_dir}
        """

# Aggregate rule to ensure all k-mer assemblies are run
rule all_kmers:
    input:
        expand("results/assembly/spades/{sample}/k{kmer}/k{kmer}_scaffolds.fasta",
               sample=config["samples"],
               kmer=config["spades"]["kmers"])