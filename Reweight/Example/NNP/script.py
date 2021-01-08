import numpy as np
import ase.io

#################################
# LOAD
#################################

traj=ase.io.read('../../dump.water.0',format='lammps-dump-text',index=':')
#conf=ase.io.read('water.lammps-data',format='lammps-data',style='atomic')

counter1=0
counter2=0
step=100
for conf in traj:
	if (counter1 % step==0):
		ase.io.write('water' + str(counter2) + '.lammps-data',conf, format='lammps-data')
		counter2 += 1
	counter1 += 1
