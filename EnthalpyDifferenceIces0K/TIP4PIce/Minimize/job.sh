#!/bin/bash
#SBATCH --ntasks=1              # total number of tasks across all nodes
#SBATCH --cpus-per-task=1       # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=1G        # memory per cpu-core (4G is default)
#SBATCH --time=00:10:00         # total run time limit (HH:MM:SS)
#SBATCH --job-name="MinREPLACE" 
#SBATCH --constraint=haswell|broadwell|skylake|cascade   # exclude ivy nodes

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export PLUMED_NUM_THREADS=$SLURM_CPUS_PER_TASK

pwd; hostname; date

module purge
module load intel-mpi intel

############################################################################
# Variables definition
############################################################################
LAMMPS_HOME=/home/ppiaggi/Programs/Lammps/lammps-git-cpu/build4
LAMMPS_EXE=${LAMMPS_HOME}/lmp_della
############################################################################

srun $LAMMPS_EXE -in start.lmp
