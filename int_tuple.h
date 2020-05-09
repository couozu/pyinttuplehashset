#include <vector>
#include <algorithm>
#include "stdint.h"

struct Tuple {
    std::vector<uint16_t> value;
};

inline bool operator<(const Tuple& a, const Tuple& b) {
    return std::lexicographical_compare(a.value.begin(), a.value.end(), b.value.begin(), b.value.end());
}