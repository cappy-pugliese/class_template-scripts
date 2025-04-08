#!/bin/bash
#SBATCH --job-name=hisat2_index
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

####################################
# Index the Genome
####################################=

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/03_indexing

# load software
module load hisat2/2.2.0

# input/output directories
OUTDIR=/home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/03_indexing/hisat2_index
GENOME=/home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/01_raw-data/genome/Fundulus_heteroclitus.Fundulus_heteroclitus-3.0.2.dna.toplevel.fa

hisat2-build -p 16 $GENOME $OUTDIR/Fhet

########### script end
