#!/bin/bash
#SBATCH --job-name=AGAT-stats
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem=15G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/02_quality-control/07_genome_agat-stats

### define files
GENOME=/home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/01_raw-data/02_genome/Fundulus_heteroclitus.Fundulus_heteroclitus-3.0.2.dna.toplevel.fa
ANNOTATION=/home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/01_raw-data/02_genome/Fundulus_heteroclitus.Fundulus_heteroclitus-3.0.2.105.gtf

### load module
module load singularity

### run AGAT
singularity exec /isg/shared/databases/nfx_singularity_cache/depot.galaxyproject.org-singularity-agat-1.4.0--pl5321hdfd78af_0.img \
  agat_sp_statistics.pl \
  --gff $ANNOTATION \
  -o agat-stat_killifish
  
########### script end
