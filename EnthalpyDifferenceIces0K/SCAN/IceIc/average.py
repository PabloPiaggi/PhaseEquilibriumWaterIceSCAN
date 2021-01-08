import numpy as np

numMolecules=64
data=np.genfromtxt("results.txt")[:,1]
print("Ic: ",np.mean(data)*96.4853075*13.6056980659/numMolecules,np.std(data)*96.4853075*13.6056980659/(numMolecules*np.sqrt(data.shape[0])),data.shape[0] )

