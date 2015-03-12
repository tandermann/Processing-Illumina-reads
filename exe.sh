#!/bin/bash
#author: Tobias Hofmann (tobiashofmann@gmx.net)
outer=1
for dir in $(find -maxdepth 1 -type d)
do 
inner=1
for file in $(find -name "*.fasta")
do
sh map_and_phase.sh $dir $file
let "inner+=1"
done
let "outer+=1"
done

rm core.*

cd ..
outer=1
for dir in $(find -maxdepth 1 -type d -name "*-results")
do
inner=1
for locus in $(find -mindepth 2 -type d)
do
presample=$(echo $locus/*original.fasta | perl -p -i -e 's/-\S+//');
sample=$(basename "$presample");
gene=$(basename "$locus");
genename=$(echo "$gene" | sed 's/.fasta//');
cp $locus/*.fasta .;
fastaname_original=$(grep ">" *original.fasta);
fastaname_allele0=$(grep ">" *allele.0.fasta);
fastaname_allele1=$(grep ">" *allele.1.fasta);
rpl "$fastaname_original" ">$sample-$genename-original" ./*original.fasta;
rpl "$fastaname_allele0" ">$sample-$genename-allele0" ./*allele.0.fasta;
rpl "$fastaname_allele1" ">$sample-$genename-allele1" ./*allele.1.fasta;
mkdir summary_results;
mkdir summary_results/$genename;
mkdir summary_results/bam-files
#mkdir summary_results/edit
mv ./*.fasta summary_results/$genename;
#grep ">" summary_results/$genename/$sample-$genename.original.fasta > summary_results/edit/$sample-$genename.original.edit.fasta;
#grep -v ">" summary_results/$genename/$sample-$genename.original.fasta | sed 's/[YWRKSM]/N/g' >> summary_results/edit/$sample-$genename.original.edit.fasta;
cp $locus/$sample-$genename.sorted.bam* summary_results/bam-files;
rm -r summary_results/$sample;
#rm -r summary_results/edit/*original.fasta-$sample.original.edit.fasta;
let "inner+=1"
done
let "outer+=1"
done
exit 0
