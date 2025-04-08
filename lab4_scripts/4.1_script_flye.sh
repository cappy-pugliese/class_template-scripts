#!/bin/bash
#SBATCH --job-name=flye_sim_genome-size
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 32
#SBATCH --mem=30G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%A.out
#SBATCH -e %x_%A.err

set -v
############# script start

hostname
date

##########################################################
##              Flye Assembly                           ##
##########################################################

module load flye/2.9.5

INDIR=~/5300_labs/5300_lab4/02_contam-filter/centrifuge
OUTDIR=~/5300_labs/5300_lab4/04_assembly

flye --nano-raw $INDIR/decom.fastq \
	--scaffold \
	--genome-size 1.6m \
	-t 32 \
	--out-dir $OUTDIR

############# script end
