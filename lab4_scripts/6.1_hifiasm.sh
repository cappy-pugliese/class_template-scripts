#!/bin/bash
#SBATCH --job-name=hifiasm
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --mem=20G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

set -v
########### script start

hostname
date

OUTDIR=/home/FCAM/eeb5300/usr14/5300_labs/5300_lab4/06_hifiasm
cd $OUTDIR

RAWREADS=/home/FCAM/eeb5300/usr14/5300_labs/5300_lab4/01_readQC/eucalyptus_nano.fastq

###########

module load Hifiasm/0.24.0


hifiasm -o eucal_nano.asm -t 8 --ont $RAWREADS


module purge

########### script end
