from setuptools import setup
from Cython.Build import cythonize

setup(
    name='Hash set for int tuples for python',
    ext_modules=cythonize('pyinttuplehashset.pyx'),
    zip_safe=False,
)