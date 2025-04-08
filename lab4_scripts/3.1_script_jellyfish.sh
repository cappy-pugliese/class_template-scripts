#!/bin/bash
#SBATCH --job-name=jellyfish-eucalyptus2
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=1G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

############ script start

hostname
date

module load jellyfish/2.2.6

INDIR=~/5300_labs/5300_lab4/02_contam-filter/trims
OUTDIR=~/5300_labs/5300_lab4/03_genome-size

jellyfish \
count -t 8 -C -m 21 -s 5G \
-o $OUTDIR/21mer_out \
--min-qual-char=? \
$INDIR/eucalyptus_R1_trim1.fastq $INDIR/eucalyptus_R2_trim2.fastq

module purge

############ script end
