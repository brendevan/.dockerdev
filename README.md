# docker-dev

## `scripts`

Here lies all scripts used to setup various components of the docker image. 

* Ideally, as much of the setup as possible should be packaged into scripts so that the same development environment can be setup easily from other places (linux, WSL, etc). 

* The scripts should be kept seperate, according to their purposes, to allow for a modular setup of the development environment.

* Note the dependency structure, where the `Dockerfile` often references specific script names and paths. Changes to the `scripts` file structure or file names should be propogated to the `Dockerfile`. 

* I currently have the R packages listed in a csv and then `install_packages.R` searches for the csv file and installs the packages. I would like to set this up for the linux programs (currently installed in the `Dockerfile` with apt-get).  