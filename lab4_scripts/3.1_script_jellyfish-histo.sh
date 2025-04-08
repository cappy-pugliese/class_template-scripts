#!/bin/bash
#SBATCH --job-name=21_mer_histo_eucalyptus2
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem=2G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

# software
module load jellyfish/2.2.6

# set variables
INDIR=~/5300_labs/5300_lab4/03_genome-size

# run jellyfish
jellyfish histo -o ${INDIR}/21mer.histo ${INDIR}/21mer_out

########### script end
