#!/bin/bash
#SBATCH --job-name=stringtie2
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

# load software
module load stringtie/2.1.5

cd /home/FCAM/eeb5300/usr14/5300_labs/5300_lab7/02_annotation

INDIR=alignments/SRR22123167.bam

stringtie -p 4 -o SRR22123167.gtf $INDIR
