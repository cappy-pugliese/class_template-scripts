#!/bin/bash
#SBATCH --job-name=BUSCO
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --mem=30G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/02_quality-control/genome_busco

module load busco/5.4.5

## OUTDIR=/home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/02_quality-control/genome_busco
OUTDIR=BUSCO
GENOME=/home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/01_raw-data/genome/Fundulus_heteroclitus.Fundulus_heteroclitus-3.0.2.dna.toplevel.fa
DATABASE=/isg/shared/databases/BUSCO/odb10/lineages/cyprinodontiformes_odb10/

busco \
    -i $GENOME \
    -o $OUTDIR \
    -l $DATABASE \
    -m genome \
    -c 8 \
    -f

########### script end
