# pyinttupleset

Set of integer tuples for python

Supports adding, iterations and check presence

Example:

```python
import itertools
import os
from pyinttupleset import PyIntTupleSet

p = PyIntTupleSet()

it = itertools.product(range(65535), repeat=10)
for _ in range(50000000):
    p.add(next(it))

print([1, 2, 3, 4, 5, 6, 7, 8, 9, 10] in p)
print([0, 0, 0, 0, 0, 0, 0, 0, 9, 10] in p)

print(f'{len(p)} objects use')
os.system(f'pmap -p {os.getpid()} | tail -n 1')
print('memory')

for i, e in enumerate(p):
    if i > 1000000:
        print(e)
    if i > 1000010:
        break
```

Output:

```
True
False
50000000 objects use
 total          4711144K
memory
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16976]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16977]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16978]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16979]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16980]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16981]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16982]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16983]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16984]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16985]
[0, 0, 0, 0, 0, 0, 0, 0, 15, 16986]
```
