import numpy as np

numMolecules=432
data=np.genfromtxt("energy.txt")
print("Ih: ",np.mean(data)*96.4853075/numMolecules,np.std(data)*96.4853075/(numMolecules*np.sqrt(data.shape[0])) )
