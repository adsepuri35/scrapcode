#include <vector>
#include <iostream>

/*

{10, 6, 5, 4}

*/

class Bowling {
public:
    std::vector<int> calculateScore(std::vector<int>& bowls) {
        std::vector<int> frameScores;

        for (int i = 0; i < bowls.size(); i++) {
            if (bowls[i] == 10) {
                frameScores.push_back(10);
                if (i + 1 < bowls.size()) frameScores.back() += bowls[i + 1];
                if (i + 2 < bowls.size()) frameScores.back() += bowls[i + 2];
            } else if (i + 1 < bowls.size() && bowls[i] + bowls[i + 1] == 10) {
                frameScores.push_back(10);
                if (i + 2 < bowls.size()) frameScores.back() += bowls[i + 2];
                i++;
            } else {
                int currentFrame = bowls[i] + ((i + 1 < bowls.size()) ? bowls[i + 1] : 0);
                frameScores.push_back(currentFrame);
                i++;
            }
        }
        return frameScores;
    }
};

int main() {

    std::vector<int> currBowls = {10, 4, 5, 6, 4, 3, 2};

    Bowling* bowling = new Bowling();

    std::vector<int> scores = bowling->calculateScore(currBowls);

    for (auto score : scores) {
        std::cout << score << "\n";
    }

    return 0;
}