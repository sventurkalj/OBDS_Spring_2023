#!/bin/sh
##########################################################################
## A script template for submitting batch jobs. To submit a batch job, 
## please type
##
##    sbatch myprog.sh
##
## Please note that anything after the characters "#SBATCH" on a line
## will be treated as a Slurm option.
##########################################################################

## Specify a partition. For general use, the partition is "batch". 
## Others are available for special purposes.
#SBATCH --partition=teaching

## The following line will send an email notification to your registered email
## address when the job ends or fails.
#SBATCH --mail-type=END,FAIL

## Specify the amount of memory that your job needs. This is for the whole job.
## Asking for much more memory than needed will mean that it takes longer to
## start when the cluster is busy.
#SBATCH --mem=10G

## Specify the number of CPU cores that your job can use. This is only relevant for
## jobs which are able to take advantage of additional CPU cores. Asking for more
## cores than your job can use will mean that it takes longer to start when the
## cluster is busy.
#SBATCH --ntasks=4

## Specify the maximum amount of time that your job will need to run. Asking for
## the correct amount of time can help to get your job to start quicker. Time is
## specified as HOURS:MINUTES:SECONDS. This example is one week.
#SBATCH --time=2:00:00

## Capture the terminal output and save any error messages. This is very useful
## if you have problems and need to ask for help.
#SBATCH --output=%j_%x.out
#SBATCH --error=%j_%x.err

kallisto quant -i /ceph/project/obds/shared/resources/1_linux/rnaseq/kallisto_index/mus_musculus_ensemble_index \
-o /project/obds/sturkalj/1_linux/2_rnaseq/1_fastq/kallisto_analysis \
-t 4 \
--rf-stranded \
ERR1755085_1.fastq.gz ERR1755085_2.fastq.gz
 
