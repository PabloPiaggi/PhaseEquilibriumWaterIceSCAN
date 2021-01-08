#!/bin/bash
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=3        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=300M       # memory per cpu-core (4G is default)
#SBATCH --time=00:20:00          # total run time limit (HH:MM:SS)
#SBATCH --job-name="MinREPLACE" 
#SBATCH --hint=multithread
#SBATCH --gres=gpu:1             # number of gpus per node

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export PLUMED_NUM_THREADS=$SLURM_CPUS_PER_TASK

pwd; hostname; date

module purge
module load rh/devtoolset/4
module load cudatoolkit/10.0
module load cudnn/cuda-10.0/7.6.3
module load openmpi/gcc/3.1.3/64

############################################################################
# Variables definition
############################################################################
LAMMPS_EXE=/home/ppiaggi/Programs/Software-deepmd-kit-1.0/lammps-git2/src/lmp_mpi
source /home/ppiaggi/Programs/Software-deepmd-kit-1.0/tensorflow-venv/bin/activate
############################################################################

############################################################################
# Run
#########################################################################
mpirun -np $SLURM_NTASKS $LAMMPS_EXE -sf omp -in start.lmp
