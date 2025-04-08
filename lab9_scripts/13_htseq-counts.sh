#!/bin/bash
#SBATCH --job-name=htseq_count
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 5
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

########################################
# Generate Counts 
########################################

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/06_count

module load htseq/0.13.5
module load parallel/20180122

INDIR=../04_align/
OUTDIR=.

# accession list
ACCLIST=../01_raw-data/accessionlist.txt

# gtf formatted annotation file
GTF=../01_raw-data/02_genome/Fundulus_heteroclitus.Fundulus_heteroclitus-3.0.2.105.gtf

# run htseq-count on each sample, up to 5 in parallel
cat $ACCLIST | \
parallel -j 5 \
    "htseq-count \
        -s no \
        -r pos \
        -f bam $INDIR/{}.bam \
        $GTF \
        > $OUTDIR/{}.counts"
