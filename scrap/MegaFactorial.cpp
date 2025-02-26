#include <iostream>
#include <vector>

using namespace std;

const int MODULO = 1000000009;

class MegaFactorial {
public:
    vector<pair<int, int>> factorize(int B) {
        vector<pair<int, int>> factors;
        for (int p = 2; p * p <= B; ++p) {
            if (B % p == 0) {
                int count = 0;
                while (B % p == 0) {
                    B /= p;
                    count++;
                }
                factors.push_back({p, count});
            }
        }
        if (B > 1) factors.push_back({B, 1});
        return factors;
    }

    long long countPrimePower(int N, int K, int p) {
        long long count = 0;
        while (N > 0) {
            count += N / p;
            N /= p;
        }
        return count;
    }

    int countTrailingZeros(int N, int K, int B) {
        vector<pair<int, int>> factors = factorize(B);
        long long minZeros = MODULO;
        for (auto &[prime, exponent] : factors) {
            long long primePower = countPrimePower(N, K, prime);
            minZeros = min(minZeros, primePower / exponent);
        }
        return minZeros % MODULO;
    }
};

void runTests() {
    MegaFactorial mf;
    vector<tuple<int, int, int, int>> testCases = {
        {6, 1, 4, 2}, {4, 2, 6, 2}, {10, 3, 10, 22}, {50, 10, 8, 806813906},
        {1000000000, 16, 2, 633700413}, {999999473, 15, 2, 500955045},
        {999997425, 15, 2, 140202729}, {999948273, 15, 8, 775102793},
        {999999999, 16, 4, 456164482}, {999997424, 16, 8, 150210979},
        {999948272, 16, 8, 915138266}, {999999909, 16, 9, 75432839},
        {999931317, 16, 3, 156213761}, {599998448, 16, 2, 578863480},
        {599982064, 16, 4, 134266524}, {599785456, 16, 2, 12733096},
        {511180784, 16, 8, 345838416}, {510656496, 16, 4, 453356111},
        {999030766, 14, 2, 321827337}, {999030770, 14, 8, 104162169},
        {1, 1, 3, 0}, {1, 15, 4, 0}, {2, 16, 2, 1}, {3, 16, 2, 16},
        {151, 14, 2, 548165411}, {512378, 9, 5, 884264929},
        {88, 8, 8, 203347860}, {127, 11, 3, 734179084},
        {188425, 4, 6, 190877618}, {996299288, 13, 3, 16838156},
        {921750, 10, 7, 344538785}, {1000000000, 10, 9, 534473941},
        {999982959, 12, 10, 137773246}, {3000, 6, 7, 174383541},
        {123424, 5, 7, 729306708}, {125125124, 12, 5, 653798224},
        {100000999, 7, 8, 67391348}, {999858252, 13, 9, 133092654},
        {514928839, 16, 9, 745852448}, {1000, 1, 4, 497},
        {1000000, 1, 3, 499993}, {25000000, 1, 10, 6249998},
        {999666888, 1, 9, 249916718}, {1000000000, 1, 7, 166666661},
        {990117872, 16, 5, 938595737}, {990380016, 16, 4, 748471515}
    };

    int passed = 0;
    for (auto &[N, K, B, expected] : testCases) {
        int result = mf.countTrailingZeros(N, K, B);
        if (result == expected) {
            cout << "Test Passed for (N=" << N << ", K=" << K << ", B=" << B << "): " << result << endl;
            passed++;
        } else {
            cout << "Test Failed for (N=" << N << ", K=" << K << ", B=" << B << "): " << result
                 << " (Expected: " << expected << ")" << endl;
        }
    }
    cout << "Total Passed: " << passed << " / " << testCases.size() << endl;
}

int main() {
    runTests();
    return 0;
}
