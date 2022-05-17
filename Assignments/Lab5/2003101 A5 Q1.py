import numpy as np, matplotlib.pyplot as plt, pandas as pd

STATES = [0,1,2,3]  # 0 = 2-bit, 1 = 1-bit
two_bit_acc = [[] for i in range(4)] # Array to store the accuracies of the 2-bit predictor
one_bit_acc = [[] for i in range(2)] # Array to store the accuracies of the 1-bit predictor


def TWO_BIT_ACCURACY(current_state, num: int):
    '''
        This function is used to calculate the accuracy of the 2-bit predictor 
        
        @param current_state: The current state of the 2-bit predictor
        @param num: The number to be predicted
    '''
    start_state = current_state > 0 # Get the start state
    right_pred = 0 # Initialize the right prediction

    for i in range(12): 
        taken_branch = num & 1 # Get the branch taken bit

        if current_state == 0: # current_state = 0
            if taken_branch == 1: # If the branch is taken
                current_state += 1
            else:
                right_pred += 1
        
        elif current_state == 1:  # current_state = 1
            if taken_branch == 1:
                current_state+=1
            else:
                current_state -= 1
                right_pred += 1
        
        elif current_state == 2: # current_state = 2
            if taken_branch == 1:
                current_state += 1
                right_pred+=1
            else:
                current_state -= 1
        
        elif current_state == 3: # current_state = 3
            if taken_branch == 1:
                right_pred += 1
            else:
                current_state -= 1
        
        else: # Error state
            continue
    
        num //= 2 # Get the next bit
    
    acc = (right_pred/12)*100 # Calculate the accuracy
    two_bit_acc[start_state].append(acc) # Store the accuracy in the array


def ONE_BIT_ACCURACY(current_state, num: int):
    '''
        This function is used to calculate the accuracy of the 1-bit predictor 
        
        @param current_state: The current state of the 1-bit predictor
        @param num: The number to be predicted
    '''
    start_state = current_state > 0 # Get the start state
    right_pred = 0 # Initialize the right prediction

    for i in range(12):
        taken_branch = num & 1 # Get the branch taken bit

        if current_state == 0:
            if taken_branch == 1:
                current_state += 2
            else:
                right_pred += 1

        elif current_state == 2:
            if taken_branch == 1:
                right_pred += 1
            else:
                current_state -= 2

        else:
            print("Error") # Error when the state is not 0 or 2

        num //= 2

    acc = (right_pred/12)*100
    one_bit_acc[start_state].append(acc)

size = 12 # Number of bits

for i in range(4):
    for j in range(1<<size):
        TWO_BIT_ACCURACY(i, j) # Calculate the accuracy of the 2-bit predictor
        if i==0 or i==2:
            ONE_BIT_ACCURACY(i, j) # Calculate the accuracy of the 1-bit predictor

# Creating the subplots - For 2 bit predictor and 1 bit predictor
plt.subplot(1, 2, 1)
plt.hist(one_bit_acc[1], weights=np.ones(len(one_bit_acc[1])) / len(one_bit_acc[1]), bins=10, color='blue', label='1-bit predictor', alpha=0.5)
plt.title("2-bit predictor")
plt.ylabel("Accuracy")
plt.xlabel("State")
plt.xticks(np.arange(0, 100, 10))
plt.yticks(np.arange(0, 0.6, 0.1))

plt.subplot(1, 2, 2)
plt.hist(one_bit_acc[0], weights=np.ones(len(one_bit_acc[0])) / len(one_bit_acc[0]), bins=10, color='green', label='1-bit predictor')
plt.title("1-bit predictor")
plt.ylabel("Accuracy")
plt.xlabel("State")
plt.xticks(np.arange(0, 100, 10))
plt.yticks(np.arange(0, 0.6, 0.1))

plt.show()
