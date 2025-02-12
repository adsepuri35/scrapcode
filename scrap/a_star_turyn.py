import heapq
import numpy as np
import random

# Function to compute NPAF of a sequence
def npaf(sequence):
    r = len(sequence)
    return [sum(sequence[i] * sequence[i + s] for i in range(r - s)) for s in range(1, r)]

# Function to compute total NPAF sum error
def total_npaf_error(sequences):
    r = len(sequences[0])
    total_error = sum(
        (sum(npaf(seq) for seq in sequences)[s])**2 for s in range(r - 1)
    )
    return total_error

# Generate initial random sequences
def generate_initial_sequences(length):
    return [random.choices([-1, 1], k=length) for _ in range(4)]

# A* Search for Turyn sequences
def a_star_turyn(length):
    initial_state = generate_initial_sequences(length)
    initial_error = total_npaf_error(initial_state)
    
    priority_queue = [(initial_error, 0, initial_state)]  # (h(n), g(n), state)
    visited = set()
    
    while priority_queue:
        _, cost, sequences = heapq.heappop(priority_queue)
        
        # Check if valid solution
        if total_npaf_error(sequences) == 0:
            return sequences
        
        # Generate neighbors (flip one element at a time)
        for i in range(4):  # 4 sequences
            for j in range(length):  # Flip each index
                new_sequences = [seq[:] for seq in sequences]
                new_sequences[i][j] *= -1  # Flip element
                
                # Compute new heuristic and cost
                new_error = total_npaf_error(new_sequences)
                new_cost = cost + 1
                
                state_tuple = tuple(tuple(seq) for seq in new_sequences)
                if state_tuple not in visited:
                    visited.add(state_tuple)
                    heapq.heappush(priority_queue, (new_error + new_cost, new_cost, new_sequences))
    
    return None  # No solution found

# Example run
length = 5  # Set length of Turyn sequence
turyn_solution = a_star_turyn(length)
if turyn_solution:
    print("Found Turyn sequences:")
    for seq in turyn_solution:
        print(seq)
else:
    print("No solution found.")
