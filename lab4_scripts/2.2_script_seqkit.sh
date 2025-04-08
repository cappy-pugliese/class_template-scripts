#!/bin/bash
#SBATCH --job-name=seqkit2
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem=1G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

set -v
########### script start

hostname
date

module load seqtk/1.2
	
INDIR=~/5300_labs/5300_lab4/02_contam-filter/centrifuge
READS=~/5300_labs/5300_lab4/01_readQC/eucalyptus_nano.fastq
	
grep 'unclassified' $INDIR/classification.tsv | cut -f 1 | sort | uniq > $INDIR/names_unclassified.txt
	
seqtk subseq $READS $INDIR/names_unclassified.txt > $INDIR/decom.fastq.gz

module purge

########### script end
