# PeriHPX 

[![CircleCI](https://circleci.com/gh/PeriHPX/PeriHPX.svg?style=shield)](https://circleci.com/gh/PeriHPX/PeriHPX) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/dba3a9de609941adad34f3a49e3b813c)](https://www.codacy.com/gh/PeriHPX/PeriHPX/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=PeriHPX/PeriHPX&amp;utm_campaign=Badge_Grade) [![codecov](https://codecov.io/gh/PeriHPX/PeriHPX/branch/main/graph/badge.svg?token=5UFVXVNV3V)](https://codecov.io/gh/PeriHPX/PeriHPX) [![cff badge](https://github.com/perihpx/perihpx/actions/workflows/cff-validator.yml/badge.svg)](https://github.com/perihpx/perihpx/actions/workflows/cff-validator.yml)  ![GitHub release](https://img.shields.io/github/release/perihpx/PeriHPX.svg) [![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/6104/badge)](https://bestpractices.coreinfrastructure.org/projects/6104) [![DOI](https://joss.theoj.org/papers/10.21105/joss.03020/status.svg)](https://doi.org/10.21105/joss.03020) [![DOI](https://zenodo.org/badge/4455628.svg)](https://zenodo.org/badge/latestdoi/4455628)


<p style="text-align:center;"><img src="https://raw.githubusercontent.com/PeriHPX/artwork/main/PNG/perihpx_logo.png" alt="logo" width="400"/></p>

## Introduction
Welcome to the PeriHPX repository. In this project, we implement Peridynamics model of fracture using meshfree and finite element discretizations. A brief overview of the equations is available [here](https://perihpx.github.io/documentation/md_content_equations.html). PeriHPX primarily served as a code for academic research (e.g., [1,2]), however, we plan to improve it further for a large-scale usage. The plan also includes development of fully distributed solver using HPX library for asynchronous computation to its maximum potential. In [3], we discuss the structure of PeriHPX and use HPX library for multi-threading computation. For further list of publications based on this library, we refer to the [publication list](https://perihpx.github.io/publications/).

At present, the library consists of multiple material models such as 
- **RNP** - Regularized Nonlinear Potential. This is implemented in class [RNPBond](src/material/pd/rnpBond.h).
- **State-based peridynamics** - State-based peridynamics model. This is implemented in class [ElasticState](src/material/pd/ElasticState.h).

One of the main features of PeriHPX is the implementation of both explicit time discretization for dynamic problems (see [FDModel](src/model/fd/fDModel.h)) and implicit discretization for quasi-static problems (see [QuasiStaticModel](src/model/quasistatic/QuasiStaticModel.h)). 

## Documentation and getting started
All source and header files are fairly well documented. We used doxygen to automatically generate the documentation of methods, classes, etc. For complete documentation follow this [link](http://perihpx.stellar-group.org/documentation/).

We provide shell scripts to help with the installation of dependencies and the PeriHPX itself. We also provide Docker images for a quick test of the library and to run the examples. In section `Installation`, we describe the dependencies, installation of dependencies, and building PeriHPX code. In section `Running PeriHPX`, we discuss how to run the examples.


## Installation

### Build tools
The following build tools are needed to compile the PeriHPX and its dependencies:
  * GCC compiler collection (gcc) > 4.9, however, gcc >= 8 is recommended
  * [autoconf](https://www.gnu.org/software/autoconf/)
  * [wget](https://www.gnu.org/software/wget/)
  * [cmake](https://cmake.org/)
  * [git](https://git-scm.com/)

   On Ubuntu you might install all dependencies using the papackage manager:

  ```bash
  apt-get install build-essential git wget cmake libssl-dev libblas-dev liblapack-dev autoconf freeglut3-dev

  ```

  On Fedora you might install all dependencies  using the package manager

  ```bash
  dnf install @development-tools cmake git wget blas-devel lapack-devel freeglut-devel
  ```

### Dependencies
We use cmake to build the code. We list the dependencies and how they are used in the code below:
  * [CMake](https://cmake.org/) 3.16
    - To generate makefiles
  * [Boost](https://www.boost.org/) 1.75
    - Required to build HPX and YAML libraries
  * [HPX](https://github.com/STEllAR-GROUP/hpx) 1.6.0
    - Provides methods for multithreading computation
  * [Blaze](https://bitbucket.org/blaze-lib/blaze/src/master/) 3.8
    - Required to build the BlazeIterative library
  * [Blaze_Iterative](https://github.com/STEllAR-GROUP/BlazeIterative) master
    - Provides linear algebra support such as storage and inversion of stiffness matrix
  * [gmsh](https://gmsh.info/) 4.7
    - Our code directly interfaces with gmsh to use input-ouput functions of gmsh
  * [VTK](https://www.vtk.org) 9.0
    - For read-write operations on `.vtu` type files
  * [YAML-CPP](https://github.com/jbeder/yaml-cpp) 0.6
    - To parse `.yaml` input files

  On Ubuntu you might install all dependencies using the papackage manager:

  ```bash
  apt-get install libyaml-cpp-dev libvtk7-dev gmsh boost-devel
  ```

  Note that on Ubuntu you need to install HPX, Blaze, and Blaze_Iterative since
  there is no package available.

  On Fedora you might install all dependencies  using the package manager

  ```bash
  dnf install hpx-devel cmake blaze-devel vtk-devel yaml-cpp-devel gmsh-devel
  ```

  Note on Fedora, you need only to install Blaze_Itertaive.


### Building dependencies
Building above dependencies is quite a challenge. To help with this, we provide the bash scripts for Ubuntu-20.04 and Fedor operating systems: [Bash scripts](https://github.com/perihpx/buildscripts/tree/main/bash)).

Further, we provide various docker files
* to build the code on Fedora using Fedora packages, see [Using Fedora Packages](https://github.com/perihpx/buildscripts/blob/main/Docker/Fedora) 
* to build all the dependencies and the code on Fedora, see [Build Dependencies and Code on Fedora](https://github.com/perihpx/buildscripts/blob/main/Docker/FedoraAll)
* to build dependencies and the code on Ubuntu-20.04, see [Build Dependencies and Code on Ubuntu](https://github.com/perihpx/buildscripts/blob/main/Docker/FedoraAll).

In [Scripts](https://github.com/perihpx/HPCBuildInfrastructure), bash scripts to build individual dependencies such as blaze, vtk, hpx, etc, on HPC systems is provided.

A more detailed version of the build instruction is available [here](https://perihpx.github.io/documentation/md_content_install_instructions.html).

> :exclamation: We recommend to use the same CMake version and same compiler version to build the HPX and PeriHPX.

### Compiling library
Assuming all the dependencies are installed at standard paths such as `/usr/local`, we build PeriHPX as follows
```sh
git clone https://github.com/perihpx/PeriHPX.git 
cd PeriHPX
mkdir build && cd build 

# turn building documentation and tools 'ON'
cmake -DCMAKE_BUILD_TYPE=Release \
      -DEnable_Documentation=ON \
      -DEnable_Tools=ON \
      .. 
      
# compile the code
make -j $(cat /proc/cpuinfo | grep processor | wc -l) VERBOSE=1
```

In case certain libraries such as `HPX, Blaze_Iterative` are installed at custom paths, one would need to provide correct paths to `cmake` as follows:
```sh
cmake -DCMAKE_BUILD_TYPE=Release \
      -DEnable_Documentation=ON \
      -DEnable_Tools=ON \
      -DHPX_DIR=<hpx-path>/lib/cmake/HPX \
      -DYAML_CPP_DIR=<yaml-cpp-path> \
      -DBLAZEITERATIVE_DIR=<blaze-iterative path> \
      -DGMSH_DIR=<gmsh-path> \
      .. 
      
make -j $(cat /proc/cpuinfo | grep processor | wc -l) VERBOSE=1
```

## Running PeriHPX
To quickly run the tests and examples, you may use Docker image with the [latest Successful build](https://hub.docker.com/r/diehlpk/PeriHPX/tags?page=1&ordering=last_updated) of the main branch. 

```sh
podman/docker pull diehlpk/PeriHPX:latest
podman/docker run -it docker.io/diehlpk/PeriHPX /bin/bash
cd /app/PeriHPX/examples/qsModel/1D
# Generate the mesh file
/app/PeriHPX/build/bin/mesh -i input_mesh.yaml -d 1
# Run the simulation
/app/PeriHPX/build/bin/PeriHPX -i input.yaml --hpx:threads=2
```

In [examples](https://perihpx.github.io/examples/), we provide information on how to prepare a simulation setup input file using [YAML](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html).

Asume, you have build PeriHPX on your own, you can go the the `build` folder and run the executable as below

```sh
cd build
./bin/PeriHPX -i input.yaml --hpx:threads=n
```

with the first argument `-i` the `input.yaml` file is specified and the second argument `--hpx:threads` the amount
of CPU cores HPX is allowed to use is specified. If you do not specify any number there all coes of the CPU are used
to run the simulation. Note that in the current version only shared memory parallism is provided, however, we plan to add
dsitributed memory to the code in the near future. 

The one-dimensional quasi-static example is computational inexpesive, therfore, we used it in the Docker example to finish the
simulation soon. For scaling test, we recommend to use any of the two-dimensional examples. 

## Trouble, issues, bugs
In case you found a bug in the library, want to contribute, or need a feature, please create a new [issue](https://github.com/perihpx/PeriHPX/issues). 


## Releases
The current stable version is [![GitHub release](https://img.shields.io/github/release/perihpx/PeriHPX.svg)](https://GitHub.com/perihpx/PeriHPX/releases/). Main development branch is the [main branch](https://github.com/perihpx/PeriHPX). For more details, we refer to the [Changelog](https://github.com/perihpx/PeriHPX/blob/main/CHANGELOG.md) file.

## Code of conduct
We have adopted a [code of conduct](https://github.com/perihpx/PeriHPX/blob/main/CODE_OF_CONDUCT.md) for this project. 

## Contributing
The source code is released under the [![GitHub license](https://img.shields.io/github/license/perihpx/PeriHPX.svg)](https://github.com/perihpx/PeriHPX/blob/main/LICENSE) license. If you like to contribute, we only accept your pull request using the same license. Please feel free to add your name to license header of the files you added or contributed to. If possible please add a test for your new feature using [CTest](https://gitlab.kitware.com/cmake/community/-/wikis/doc/ctest/Testing-With-CTest). We adapted the Google C++ [Style Guide](https://google.github.io/styleguide/cppguide.html) for this project. We use the [clang-format](https://clang.llvm.org/docs/ClangFormat.html) tool to format the source code with respect to this style guide. Please run the `format.sh` script before your do the pull request.

## Citing
In publications, please use our paper as the main citation for PeriHPX: 
* Diehl, P., Jha, P. K., Kaiser, H., Lipton, R., & Lévesque, M. (2020). An asynchronous and task-based implementation of peridynamics utilizing HPX—the C++ standard library for parallelism and concurrency. SN Applied Sciences, 2(12), 1-21.

For more references, we refer to PeriHPX's [publication list](https://perihpx.github.io/publications/).

## Acknowledgments
PeriHPX has been funded by:
* Army Research Office Grant # W911NF-16-1-0456 to PI Dr. Robert Lipton (Professor at Louisiana State University). This grant supported Prashant K. Jha on a postdoctoral position from October 2016 - July 2019.
*  Canada Research Chairs Program under the Canada Research Chair in Multiscale Modelling of Advanced Aerospace Materials held by M. Lévesque; Natural Sciences and Engineering Research Council of Canada (NSERC) Discovery Grants Program under Discovery Grant RGPIN-2016-06412.
* We are grateful for the support of the [Google Summer of Code program](https://summerofcode.withgoogle.com/) funding internships.

## References
[1] Jha, P. K., & Lipton, R. (2019). Numerical convergence of finite difference approximations for state based peridynamic fracture models. Computer Methods in Applied Mechanics and Engineering, 351, 184-225.

[2] Jha, P. K., & Lipton, R. P. (2020). Kinetic relations and local energy balance for LEFM from a nonlocal peridynamic model. International Journal of Fracture, 226(1), 81-95.

[3] Diehl, P., Jha, P. K., Kaiser, H., Lipton, R., & Lévesque, M. (2020). An asynchronous and task-based implementation of peridynamics utilizing HPX—the C++ standard library for parallelism and concurrency. SN Applied Sciences, 2(12), 1-21.

For more references, we refer to the PeriHPX's [publication list](http://perihpx.stellar-group.org/publications/).
