#!/bin/bash
#SBATCH --job-name=3busco
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --mem=35G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err

hostname
date

############################################
##              BUSCO      
############################################

## load modules
module load busco/5.4.5

## set paths
OUTDIR=/home/FCAM/eeb5300/usr14/group_project/04_check-masurca/01_busco/3busco/

GENOME=/home/FCAM/eeb5300/usr14/group_project/03_masurca/masurca_outputs/3masurca.fasta

LINEAGE=/home/FCAM/eeb5300/usr14/group_project/01_raw-data/BuscoLineage/busco_downloads/lineages/actinopterygii_odb10

cd $OUTDIR

## run busco
busco \
    -i ${GENOME} \
    -o ${OUTDIR} \
    -l ${LINEAGE} \
    -m genome \
    -c 16 \
    -f
    
