#!/bin/bash -l
#SBATCH --nodes 1
#SBATCH --ntasks 8
#SBATCH --mem-per-cpu=3G       # memory per cpu-core (4G is default)
#SBATCH --time=24:00:00          # total run time limit (HH:MM:SS)
#SBATCH --job-name="c-REPLACE" 

module load intel intel-mpi intel-mkl

PW=/home/ppiaggi/Programs/QuantumEspresso/q-e-qe-6.4.1/bin/pw.x

srun $PW < pw-water-REPLACE.in > pw-water-REPLACE.out
