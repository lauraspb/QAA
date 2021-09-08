#!/usr/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --time=10:00:00
#SBATCH --mail-user='lpaez@uoregon.edu'
#SBATCH --mail-type=END,FAIL

/usr/bin/time -v trimmomatic PE -phred33 -trimlog logoutput.txt -summary sumoutput.txt \
/projects/bgmp/shared/2017_sequencing/demultiplexed/24_4A_control_S18_L008_R1_001.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/24_4A_control_S18_L008_R2_001.fastq.gz \
-baseout trimoutput_24.fq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

