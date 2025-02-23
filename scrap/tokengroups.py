import random

teams = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,25,26,27,28,29,30,32,33,34,35]

random.shuffle(teams)

group1 = teams[:8]
group2 = teams[8:16]
group3 = teams[16:24]
group4 = teams[24:]

for i in range(max(len(group1), len(group2), len(group3), len(group4))):
    print(f"{group1[i] if i < len(group1) else ''}\t{group2[i] if i < len(group2) else ''}\t{group3[i] if i < len(group3) else ''}\t{group4[i] if i < len(group4) else ''}")