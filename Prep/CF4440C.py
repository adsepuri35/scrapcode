def min_digits(x, one_seq):
    if x <= 11:
        return min(x, 13 - x)
    
    i = 16
    while one_seq[i - 1] >= x:
        i -= 1
    
    num_ops = (x // one_seq[i - 1]) * (i - 1)
    num_ops += min_digits(x % one_seq[i - 1], one_seq)
    
    if x < one_seq[i] - x:
        return num_ops
    return min(num_ops, i + min_digits(one_seq[i] - x, one_seq))

def main():
    import sys
    input = sys.stdin.read
    
    one_seq = [0] * 18
    one_seq[1] = 1
    for i in range(2, 17):
        one_seq[i] = 10 * one_seq[i - 1] + 1
    
    #n = 121
    # n  =21
    # n = 59191919191919
    # n = 2673749
    # n = 614407991527
    # n = 8322353333746
    # n = 26602792766013
    # n = int(input().strip())
    print(min_digits(n, one_seq))

if __name__ == "__main__":
    main()