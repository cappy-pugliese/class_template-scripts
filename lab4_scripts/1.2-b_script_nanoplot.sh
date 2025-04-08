#!/bin/bash
#SBATCH --job-name=eucalyptus-nanoplot
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 10
#SBATCH --mem=50G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

############ script start
set -v

hostname
date

### load modules
module load NanoPlot/1.33.0

### set variables
INDIR=~/large-files/lab4_data
OUTDIR=~/EEB-5300_labs/5300_lab4/results/reports

### nanoplot
NanoPlot --fastq $INDIR/eucalyptus_nano.fastq \
        --loglength \
        -o  $OUTDIR/nanoplot \
        -t 10

module purge

############ script end