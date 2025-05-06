#!/bin/bash
#SBATCH --job-name=1quast
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=5G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err

hostname
date

################################
##       QUAST                                         
################################

## load modules
module load quast/5.2.0

## set paths
GENOME=/home/FCAM/eeb5300/usr14/group_project/03_masurca/masurca_outputs/1mascura.fasta

OUTDIR=/home/FCAM/eeb5300/usr14/group_project/04_check-masurca/02_quast/1quast

cd $OUTDIR

## run quast
quast.py ${GENOME} \
        --threads 8 \
        -o ${OUTDIR}