def getSpeedFromTime(time):
    return 2*time

def getTimeFromSpeed(speed):
    return speed/2

#Solves the 2 sum problem brute force
def SumBruteForce(arr, target):
    for i in range(len(arr)):
        for j in range(i+1, len(arr)):
            if arr[i] + arr[j] == target:
                return [i, j]
