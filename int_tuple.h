#include <vector>
#include <algorithm>

struct Tuple {
    std::vector<int> value;
};

inline bool operator<(const Tuple& a, const Tuple& b) {
    return std::lexicographical_compare(a.value.begin(), a.value.end(), b.value.begin(), b.value.end());
}