#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 12
#SBATCH --mem=20G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

#########################################
# Trimming/QC of reads using fastp
#########################################

cd /home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/week10-class_portion/02_quality-control

module load fastqc/0.11.7
module load parallel/20180122

# set input/output directory variables
INDIR=trimmed_sequences
REPORTDIR=fastqc_reports
mkdir -p $REPORTDIR

ACCLIST=../01_raw-data/accessionlist.txt
# run fastp in parallel, 4 samples at a time
cat $ACCLIST | parallel -j 4 \
    fastqc --outdir $REPORTDIR $INDIR/{}_trim_{1..2}.fastq.gz
    
########### script end
