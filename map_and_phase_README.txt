Author: Tobias Hofmann (tobiashofmann@gmx.net)

This script takes quality and adapter trimmed reads and maps them against provided references (fasta-format). A bam file is created (+indexfile) which then is phased by samtools. Using samtools mpileup, this script creates a consensus sequence for each locus, separately for each phased alleles and the unphased bam-file. These consensus sequences are stored in fasta format and copied into project/summary_results).

You need to have CLC-AssemblyCell installed (compatibility positively tested with clc-assembly-cell-4.3.0-linux_64), all other programs are installed in the bin folder or part of the linux server package.

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



