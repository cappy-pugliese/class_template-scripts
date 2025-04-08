#!/bin/bash
#SBATCH --job-name=BUSCO_vir
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

########## BUSCO ########## 


module load busco/5.4.5

mkdir /home/FCAM/eeb5300/usr14/5300_labs/5300_lab4/05_assemblyQC/viridplantae_run
OUTDIR="/home/FCAM/eeb5300/usr14/5300_labs/5300_lab4/05_assemblyQC/viridplantae_run"
GENOME="/home/FCAM/eeb5300/usr14/5300_labs/5300_lab4/04_assembly/assembly.fasta"
DATABASE="/isg/shared/databases/BUSCO/odb10/lineages/viridiplantae_odb10/"

busco \
    -i $GENOME \
    -o $OUTDIR \
    -l $DATABASE \
    -m genome \
    -c 8 \
    -f
    
########### script end
