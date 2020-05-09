# distutils: language = c++

from libcpp.set cimport set
from libcpp.vector cimport vector
from cython.operator cimport dereference as deref, preincrement as inc

cdef extern from "int_tuple.h":
    cdef cppclass Tuple:
        vector[int] value
    bint operator<(Tuple&, Tuple&)

cdef class PyIntTupleHashSetIterator:
    cdef:
        set[Tuple].iterator it
        set[Tuple].iterator end

    def __next__(self):
        if self.it == self.end:
            raise StopIteration()
        ret = deref(self.it)
        self.it = inc(self.it)
        return ret.value

cdef class PyIntTupleHashSet:
    cdef:
        set[Tuple] data

    def add(self, val):
        cdef Tuple t
        t.value.resize(len(val))
        for i, v in enumerate(val):
            t.value[i] = v
        self.data.insert(t)

    def __iter__(self):
        it = PyIntTupleHashSetIterator()
        it.it = self.data.begin()
        it.end = self.data.end()
        return it
