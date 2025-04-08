#!/bin/bash
#SBATCH --job-name=hisat2_align
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --mem=10G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

#################################################################
# Index the Genome
#################################################################

cd /home/FCAM/eeb5300/usr14/5300_labs/5300_lab7/02_annotation

module load hisat2/2.2.0
module load samtools/1.12

INDIR=illumina
OUTDIR=alignments
SAMPLE=SRR22123167

INDEX=hisat2/euc_index

hisat2 \
        -p 4 \
        -x $INDEX \
        -1 $INDIR/SRR22123167_1.fastq \
        -2 $INDIR/SRR22123167_2.fastq | \
samtools view -@ 1 -S -h -u - | \
samtools sort -@ 1 -T $SAMPLE - >$OUTDIR/$SAMPLE.bam

# index bam files
samtools index $OUTDIR/$SAMPLE.bam

########### script end
