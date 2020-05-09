#include <vector>
#include <algorithm>
#include "stdint.h"

typedef std::vector<uint32_t> IntTuple;

inline bool operator<(const IntTuple& a, const IntTuple& b) {
    return std::lexicographical_compare(a.begin(), a.end(), b.begin(), b.end());
}