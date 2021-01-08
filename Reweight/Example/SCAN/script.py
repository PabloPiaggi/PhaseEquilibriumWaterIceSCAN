import numpy as np
import ase.io
from ase.calculators.espresso import Espresso

################################
# QE options
################################
pseudopotentials = {'H': 'H_ONCV_PBE_sr.upf',
                    'O': 'O_ONCV_PBE_sr.upf'}

input_qe = {
            'calculation':'scf',
            'outdir':'./',
            'pseudo_dir':'/home/ppiaggi/QuantumEspresso/pseudos',
            'system':{
              'ecutwfc': 140,
              'input_dft': 'SCAN',
             },
            'electrons':{
               'mixing_beta': 0.5,
               'startingwfc': 'atomic+random',
               'startingpot': 'atomic',
             },
} 

#################################
# LOAD
#################################

traj=ase.io.read('dump.water.3',format='lammps-dump-text',index=':')
#conf=ase.io.read('water.lammps-data',format='lammps-data',style='atomic')

counter1=0
counter2=0
step=1000
for conf in traj:
	if (counter1 % step==0):
		################################
		# Choose species
		################################
		new_species=np.array(conf.get_chemical_symbols())
		new_species[new_species=='H']='O'
		new_species[new_species=='He']='H'
		conf.set_chemical_symbols(new_species)
		ase.io.write('pw-water-' + str(counter2) + '.in',conf, format='espresso-in',input_data=input_qe, pseudopotentials=pseudopotentials,tstress=True, tprnfor=True)
		counter2 += 1
	counter1 += 1
