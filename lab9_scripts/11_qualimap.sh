#!/bin/bash 
#SBATCH --job-name=qualimap
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --mem=10G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

##################################
# calculate stats on alignments
##################################

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/05_alignQC

# this time we'll use qualimap

# load software--------------------------------------
module load qualimap/2.2.1
module load parallel/20180122

# input, output directories--------------------------

INDIR=../04_align
OUTDIR=qualimap_reports
mkdir -p $OUTDIR

# gtf annotation is required here
GTF=../01_raw-data/02_genome/Fundulus_heteroclitus.Fundulus_heteroclitus-3.0.2.105.gtf

# accession list
ACCLIST=../01_raw-data/accessionlist.txt

# run qualimap in parallel
cat $ACCLIST | \
parallel -j 5 \
    qualimap \
        rnaseq \
        -bam $INDIR/{}.bam \
        -gtf $GTF \
        -outdir $OUTDIR/{} \
        --java-mem-size=2G  
        
########### script end
