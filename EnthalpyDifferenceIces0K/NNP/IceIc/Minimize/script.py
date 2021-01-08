import numpy as np

numMolecules=512
data=np.genfromtxt("energy.txt")
print("Ic: ",np.mean(data)*96.4853075/numMolecules,np.std(data)*96.4853075/(numMolecules*np.sqrt(data.shape[0])),data.shape[0] )
