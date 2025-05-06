#!/bin/bash
#SBATCH --job-name=kraken
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 16
#SBATCH --mem=200G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

module load kraken/2.1.2
module load jellyfish/2.3.0
#module load parallel/20180122

cd /home/FCAM/eeb5300/usr14/group_project/02_quality-control

#### insert pathways
INDIR=/home/FCAM/eeb5300/usr14/group_project/01_raw-data/02_illumina-data/03_fasterq
OUTDIR=/home/FCAM/eeb5300/usr14/group_project/02_quality-control

#ACCLIST=/home/FCAM/eeb5300/usr14/group_project/01_raw-data/02_illumina-data/accession-list.txt
# not sure if this will work properly or not, might have to copy and past actual filename if setup doesn't work


#### run kraken
#cat $ACCLIST | parallel -j 3 \
  kraken2 -db /isg/shared/databases/kraken2/StandardPlus \
	  --paired SRR19126251_1.fastq SRR19126251_2.fastq \
	  --use-names \
	  --threads 16 \
	  --output $OUTDIR/SRR19126251-2_kraken_general.out \
	  --unclassified-out $OUTDIR/SRR19126251-2_unclassified#.fastq \
	  --classified-out $OUTDIR/{SRR19126251-2_classified#.fastq \
	  --report $OUTDIR/SRR19126251-2_kraken_report.txt \
	  --use-mpa-style 

########### script end