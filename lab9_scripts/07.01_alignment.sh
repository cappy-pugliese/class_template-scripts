#!/bin/bash
#SBATCH --job-name=align
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --mem=11G
#SBATCH --partition=xeon
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%A_%a.out
#SBATCH -e %x_%A_%a.err
#SBATCH --array=[0-18]%5

########### script start

hostname
date

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/04_aligning

#################################################################
# Align reads to genome
#################################################################
module load hisat2/2.2.1
module load samtools/1.12

INDIR=../02_quality-control/trimmed_sequences
OUTDIR=.


# this is an array job. 
	# one task will be spawned for each sample
	# for each task, we specify the sample as below
	# use the task ID to pull a single line, containing a single accession number from the accession list
	# then construct the file names in the call to hisat2 as below

INDEX=../03_indexing/hisat2_index/Fhet

ACCLIST=../01_raw-data/accessionlist.txt

NUM=$(expr ${SLURM_ARRAY_TASK_ID} + 1)

SAMPLE=$(sed -n ${NUM}p $ACCLIST)

# run hisat2
hisat2 \
	-p 2 \
	-x $INDEX \
	-1 $INDIR/${SAMPLE}_trim_1.fastq.gz \
	-2 $INDIR/${SAMPLE}_trim_2.fastq.gz | \
samtools view -@ 1 -S -h -u - | \
samtools sort -@ 1 -T $SAMPLE - >$OUTDIR/$SAMPLE.bam

# index bam files
samtools index $OUTDIR/$SAMPLE.bam

########### script end
