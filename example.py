import itertools
import os

from pyinttuplehashset import PyIntTupleHashSet

p = PyIntTupleHashSet()

it = itertools.product(range(65535), repeat=10)
for _ in range(50000000):
    p.add(next(it))

print(f'{len(p)} objects use')
os.system(f'pmap -p {os.getpid()} | tail -n 1')
print('memory')
