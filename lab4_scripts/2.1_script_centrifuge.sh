#!/bin/bash
#SBATCH --job-name=nanopore_centrifuge
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 12
#SBATCH --mem=100G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=END
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

############ script start

hostname
date

# load modules
module load centrifuge/1.0.4

# set variables
INDIR=~/large-files/lab4_data
OUTDIR=~/EEB-5300_labs/5300_lab4/results

# run centrifuge
centrifuge -q \
	-p 12 \
	--mm \
	-x /isg/shared/databases/centrifuge/b+a+v+f_sep_2024/fbav \
	--report-file $OUTDIR/report.tsv \
	--quiet \
	--min-hitlen 50 \
        -k 1 \
	-U $INDIR/eucalyptus_nano.fastq \
	-S $OUTDIR/classification.tsv


############ end script
