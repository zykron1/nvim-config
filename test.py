def getSpeedFromTime(x):
	return x*2

def getTimeFromSpeed(x):
	return x/2

#Solves the 2 sum problem brute force
def SumBruteForce(arr, target):
	for i in range(len(arr)):
		for j in range(i+1, len(arr)):
			if arr[i] + arr[j] == target:
				return [i, j]
