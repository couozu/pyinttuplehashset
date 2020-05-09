from setuptools import setup
from Cython.Build import cythonize

setup(
    name='Set of int tuples for Python',
    ext_modules=cythonize('pyinttupleset.pyx'),
    zip_safe=False,
)
