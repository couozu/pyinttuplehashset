# distutils: language = c++

from libcpp.set cimport set
from libcpp.vector cimport vector
from libc.stdint cimport uint32_t
from cython.operator cimport dereference as deref, preincrement as inc

ctypedef vector[uint32_t] IntTuple

cdef extern from "int_tuple.h":
    pass

cdef class PyIntTupleSetIterator:
    cdef:
        set[IntTuple].iterator it
        set[IntTuple].iterator end

    def __next__(self):
        if self.it == self.end:
            raise StopIteration()
        ret = deref(self.it)
        self.it = inc(self.it)
        return ret

cdef class PyIntTupleSet:
    cdef:
        set[IntTuple] data

    def add(self, val):
        cdef IntTuple t
        t.resize(len(val))
        for i, v in enumerate(val):
            t[i] = v
        self.data.insert(t)

    def __contains__(self, val):
        cdef IntTuple t
        t.resize(len(val))
        for i, v in enumerate(val):
            t[i] = v
        return self.data.find(t) != self.data.end()

    def __iter__(self):
        it = PyIntTupleSetIterator()
        it.it = self.data.begin()
        it.end = self.data.end()
        return it

    def __len__(self):
        return self.data.size()
