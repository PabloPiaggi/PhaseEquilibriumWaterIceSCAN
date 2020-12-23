#!/bin/bash
#SBATCH --ntasks=8              # total number of tasks across all nodes
#SBATCH --nodes=1              # number of nodes
#SBATCH --cpus-per-task=1       # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=300M      # memory per cpu-core (4G is default)
#SBATCH --time=24:00:00         # total run time limit (HH:MM:SS)
#SBATCH --job-name="REPLACE" 
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
cycles=1
partitions=1
############################################################################

############################################################################
# Run
############################################################################
if [ -e runno ] ; then
   #########################################################################
   # Restart runs
   #########################################################################
   nn=`tail -n 1 runno | awk '{print $1}'`
   srun $LAMMPS_EXE -sf omp -partition ${partitions}x8 -in Restart.lmp
   #########################################################################
else
   #########################################################################
   # First run
   #########################################################################
   nn=1
   # Number of partitions
   srun $LAMMPS_EXE -sf omp -partition ${partitions}x8 -in start.lmp
   #########################################################################
fi
############################################################################

############################################################################
# Prepare next run
############################################################################
# Back up
############################################################################
for j in $(seq 0 3)
do
        cp log.lammps.${j} log.lammps.${j}.${nn}
        cp restart2.lmp.${j} restart2.lmp.${j}.${nn}
        cp restart.lmp.${j} restart.lmp.${j}.${nn}
        cp data.final.${j} data.final.${j}.${nn}
done
############################################################################

############################################################################
# Check number of cycles
############################################################################
mm=$((nn+1))
echo ${mm} > runno
#cheking number of cycles
if [ ${nn} -ge ${cycles} ]; then
  exit
fi
############################################################################

############################################################################
# Resubmitting again
############################################################################
sbatch < job.sh
############################################################################

date
