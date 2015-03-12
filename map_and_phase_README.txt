Author: Tobias Hofmann (tobiashofmann@gmx.net)

An automated pipeline for fq-file processing:

First, download exe.sh and map_and_phase.sh.
You also need to have CLC-AssemblyCell (clc-assembly-cell-4.3.0-linux_64), samtools (samtools-0.1.19) and picard-tools (picard-tools-1.97) installed and you might also need to download and install the rpl (replace) function (downloads.laffeycomputer.com/current_builds/rpl-1.3.0b3-mac-osX.tar.gz).

These scripts take quality and adapter trimmed reads (fq-format) and map them against provided references (fasta-format). A bam file is created (+indexfile) which then is phased by samtools. Using samtools mpileup, this script creates a consensus sequence for each locus, separately for each phased allele and the unphased bam-file. These consensus sequences are stored in fasta format and copied into project/summary_results).

Create the following folder-structure:

project/
	data/
		exe.sh
		map_and_phase.sh
	
Now load your trimmed reads into the data folder, each set of trimmed reads in a separate folder, named with the sample name/ID. The trimmed reads should be in named as in this example: species1-READ1.fq species1-READ2.fq
Next copy your reference fasta files into the data folder (you can run multiple references at the same time).
When everything is in place (see below) run exe.sh (cd to data/ folder and type "sh exe.sh")
The final file structure should look like this:

project/
	data/
		species1/	
			species1-READ1.fq	species1-READ2.fq	 
		species2/
			species2-READ1.fq	species2-READ2.fq
		exe.sh
		map_and_phase.sh
		reference_gene_a.fasta
		reference_gene_b.fasta
		reference_gene_c.fasta



