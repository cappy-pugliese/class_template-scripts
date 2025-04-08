#!/bin/bash
#SBATCH --job-name=fastp-eucalyptus-SR
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=2G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH --mail-type=ALL
#SBATCH -o ../submitted-jobs/%x_%j.out
#SBATCH -e ../submitted-jobs/%x_%j.err

## script start
set -v

hostname
date

### set variables
INDIR=~/large-files/lab4_data

TRIMDIR=~/large-files/lab4_data/trims
# mkdir ~/EEB-5300_labs/5300_lab4/data/trims

REPORTDIR=~/EEB-5300_labs/5300_lab4/results/reports
# mkdir ~/EEB-5300_labs/5300_lab4/results/reports

### load modules
module load fastp/0.23.2

### code to run
fastp -p \
    --in1 $INDIR/eucalyptus_R1.fastq \
    --in2 $INDIR/eucalyptus_R2.fastq \
    --out1 $TRIMDIR/eucalyptus_R1_trim1.fastq \
    --out2 $TRIMDIR/eucalyptus_R2_trim2.fastq \
    --json $REPORTDIR/eucalyptus_SR_fastp.json \
    --html $REPORTDIR/eucalyptus_SR_fastp.html

module purge

## script end
