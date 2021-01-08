#!/bin/bash -l
#SBATCH --nodes 1
#SBATCH --ntasks 8
#SBATCH --mem-per-cpu=3G       # memory per cpu-core (4G is default)
#SBATCH --time=06:00:00          # total run time limit (HH:MM:SS)
#SBATCH --job-name="qe-scf" 

module load intel intel-mpi intel-mkl

PW=/home/ppiaggi/Programs/QuantumEspresso/q-e-qe-6.4.1/bin/pw.x

srun $PW -input REPLACE1 > REPLACE2
~                                                                          
