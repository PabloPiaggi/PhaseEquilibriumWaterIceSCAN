import numpy as np
import ase.io
from ase.calculators.espresso import Espresso

################################
# QE options
################################
pseudopotentials = {'H': 'H_ONCV_PBE_sr.upf',
                    'O': 'O_ONCV_PBE_sr.upf'}

input_qe = {
            'calculation':'vc-relax',
            'outdir':'./',
            'pseudo_dir':'/global/homes/p/ppiaggi/QuantumEspresso/pseudos',
            'system':{
              'ecutwfc': 150,
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

for i in range(1,31):
	conf=ase.io.read('min' + str(i) + '.data',format='lammps-data',style='atomic')
	################################
	# Choose species
	################################
	new_species=np.array(conf.get_chemical_symbols())
	new_species[new_species=='H']='O'
	new_species[new_species=='He']='H'
	conf.set_chemical_symbols(new_species)
	ase.io.write('pw-water-' + str(i) + '.in',conf, format='espresso-in',input_data=input_qe, pseudopotentials=pseudopotentials,tstress=True, tprnfor=True)
