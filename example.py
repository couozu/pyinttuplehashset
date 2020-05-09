from pyinttuplehashset import PyIntTupleHashSet

p = PyIntTupleHashSet()

p.add([2, 3, 4])
p.add([3, 5, 5])
p.add([3, 4, 5])
p.add([4, 22, 2])
p.add([3, 5, 5])

for i in p:
    print(','.join(map(str, i)))