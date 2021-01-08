import ase.io
conf=ase.io.read('1h-full.data',format='lammps-data',style='full')
ase.io.write('1h.data',conf, format='lammps-data')
quit()
