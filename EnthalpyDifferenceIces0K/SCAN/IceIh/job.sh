#!/bin/bash
#SBATCH --qos=regular
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=68
#SBATCH --cpus-per-task=1
#SBATCH -C knl,quad,cache
#SBATCH --job-name="h-REPLACE"

export OMP_NUM_THREADS=1
export OMP_PLACES=threads
export OMP_PROC_BIND=spread

module load espresso/6.6-libxc-5.0.0

srun --cpu-bind=cores pw.x -input pw-water-REPLACE.in > pw-water-REPLACE.out
