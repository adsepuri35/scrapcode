#include <iostream>


// aabc -> b
// abc -> a

// aabbcc

// a=2,b=1,c=1

// for loop 1 -> count char frequencies

// for loop 2 -> 

// ""
// null
// aabc
// aAbc -> a
// cases with chars but no singles
// very long strings

// abca
// 3 chars = max capacity

char findFirstSingle(string str) {
    if (!str) return null;
    if (str == "") return null;
    unordered_map<char, int> charFreq;

    //pair (freq, index)

    for (char c : str) {
        charFreq[c]++;
    }

    for (char c : str) {
        if (charFreq[c] == 1) {
            return c;
        }
    }

    return null;
}

// 
