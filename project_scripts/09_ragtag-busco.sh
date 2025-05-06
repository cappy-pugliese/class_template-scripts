#!/bin/bash
#SBATCH --job-name=3sal_busco
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --mem=60G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ryan.shirvell@uconn.edu
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err

hostname
date

##########################################################
##              BUSCO                                   ##
##########################################################

module load busco/5.4.5

OUTDIR=/home/FCAM/eeb5300/usr14/group_project/06_check-ragtag/01_busco/3salmon
    mkdir -p ${OUTDIR}

GENOME=/home/FCAM/eeb5300/usr14/group_project/05_ragtag/01_salm-ref_ragtag/3ragtag/run2_more-mem/ragtag.scaffold.fasta

DATABASE=/home/FCAM/eeb5300/usr14/group_project/01_raw-data/BuscoLineage/busco_downloads/lineages/actinopterygii_odb10

cd $OUTDIR

busco \
    -i ${GENOME} \
    -o ${OUTDIR} \
    -l ${DATABASE} \
    -m genome \
    -c 16 \
    -f