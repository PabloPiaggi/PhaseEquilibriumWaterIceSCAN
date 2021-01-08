# Phase equilibirum of water with hexagonal and cubic ice using the SCAN functional
## Pablo M. Piaggi, Athanassios Z. Panagiotopoulos, Pablo G. Debenedetti, and Roberto Car
## To be submitted to Journal of Chemical Theory and Computation

Input files to reproduce the results of the paper.

* ```CoexistenceSimulations```: LAMMPS input files to run coexistence simulations of liquid water-ice Ih and liquid water-ice Ic, using the neural network potential (NNP) and TIP4P/Ice.
* ```Crystallization```: LAMMPS + PLUMED files to run crystallization simulations of ice Ih and Ic in the isothermal and multithermal ensembles.
* ```EnthalpyDifferenceIces0K```: LAMMPS input files to calculate enthalpies at 0 K of ice Ih and ice Ic at 0 K using the NNP and TIP4P/Ice. QuantumEspresso input files to perform SCAN calculations. Initial configurations of 30 different proton configurations are included.
* ```MultithermalSimulations```: LAMMPS + PLUMED input files to run multithermal simulations of liquid water, ice Ih, and ice Ic.
* ```NNP-DeePMD-model```: DeePMD NNP frozen model. The file inside this folder is needed to run all calculations using the NNP.
* ```Reweight```: Example of input files to perform reweighting using SCAN energies of configurations obtained from a trajectory driven by the NNP.

If you have questions send me an email to ppiaggi at princeton.edu
