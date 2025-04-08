#!/bin/bash
#SBATCH --job-name=fastp_trimming
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

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/02_quality-control

module load fastp/0.23.2
module load parallel/20180122

# set input/output directory variables
INDIR=/home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/01_raw-data/download_attempt2
REPORTDIR=fastp_reports-2
TRIMDIR=trimmed_seq-2

ACCLIST=/home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/01_raw-data/pt-2_accessionlist.txt

# run fastp in parallel, 4 samples at a time
cat $ACCLIST | parallel -j 4 \
fastp \
        --in1 $INDIR/{}_1.fastq.gz \
        --in2 $INDIR/{}_2.fastq.gz \
        --out1 $TRIMDIR/{}_trim_1.fastq.gz \
        --out2 $TRIMDIR/{}_trim_2.fastq.gz \
        --json $REPORTDIR/{}_fastp.json \
        --html $REPORTDIR/{}_fastp.html
        
########### script end
