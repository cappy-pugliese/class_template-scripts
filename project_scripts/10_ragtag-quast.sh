#!/bin/bash
#SBATCH --job-name=3sal_quast
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=5G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ryan.shirvell@uconn.edu
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err

hostname
date

##########################################################
##              QUAST                                   ##
##########################################################

## load modules
module load quast/5.2.0

## set paths
GENOME=/home/FCAM/eeb5300/usr14/group_project/05_ragtag/01_salm-ref_ragtag/3ragtag/run2_more-mem/ragtag.scaffold.fasta

OUTDIR=/home/FCAM/eeb5300/usr14/group_project/06_check-ragtag/02_quast/3salmon
mkdir -p ${OUTDIR}

cd $OUTDIR

## run quast
quast.py ${GENOME} \
        --threads 8 \
        -o ${OUTDIR}