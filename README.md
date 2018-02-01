# swigTest

Testing swig for generating python and matlab wrappers.

## Building

### Prerequisites

In order to build the project you need:

* python
* matlab 
* swig

#### SWIG with matlab support

If you need the matlab wrapper then you should switch to a developer version of swig.
You need to checkout the `matlab` branch from the swig repository

``` 
git clone --branch matlab https://github.com/swig/swig.git
```

Please refer to http://www.swig.org/svn.html for the necessary tools needed to build.
and then install it:

``` 
cd swig
./autogen.sh 
./configure --prefix=`pwd`/build/install --with-matlab=/Applications/MATLAB_R2015b.app/
make -j8
make install
```

Change `--prefix=<install_path>` to any directory where you want to install swig. 
Change `--with-matlab=<matlabroot>` to the root path of your matlab installation (note it will look for matlab binaries into `<matlabroot>/bin`).

Then at `cmake` stage you have to pass `-DCMAKE_PREFIX_PATH=<install_path>` so that the installed version can be found (unless you install in a system directory).
### Building the wrappers

The generation of the wrappers is controlled by two cmake options:

```cmake
option(BUILD_MATLAB_WRAPPER "Build the matlab wrapper with SWIG" ON)
option(BUILD_PYTHON_WRAPPER "Build the python wrapper with SWIG" ON)
```
so you can change the behaviour at `cmake` stage with eg `-DBUILD_MATLAB_WRAPPER:BOOL=OFF`.