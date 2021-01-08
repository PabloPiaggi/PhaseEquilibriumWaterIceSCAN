import ase.io
conf=ase.io.read('1c-full.data',format='lammps-data',style='full')
ase.io.write('1c.data',conf, format='lammps-data')
quit()
