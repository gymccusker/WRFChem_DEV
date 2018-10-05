#!/bin/bash --login
#
#PBS -l select=serial=true:ncpus=1
#PBS -l walltime=04:00:00
#PBS -A n02-NEK01482X

#PBS -M giyoung@bas.ac.uk
#PBS -m b
#PBS -m e
module swap PrgEnv-cray PrgEnv-intel  # for WRFV3.5.1 and above
module swap PrgEnv-intel/5.2.82 PrgEnv-intel/5.1.29
#module swap intel/17.0.0.098 intel/14.0.4.211
module swap cray-libsci/16.11.1 cray-libsci/13.2.0
module load cray-netcdf/4.3.2
module load cray-hdf5/1.8.14

export TMPDIR=/home/n02/n02/mbexkgy2/tmp

export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export WRF_CHEM=1
export WRF_EM_CORE=1
export WRF_NMM_CORE=0

export NETCDF=/opt/cray/netcdf/4.3.2/intel/140
# Make sure any symbolic links are resolved to absolute path
export PBS_O_WORKDIR=$(readlink -f $PBS_O_WORKDIR)
# Change to the directory that the job was submitted from
cd $PBS_O_WORKDIR
compile em_real >& compile_log.txt

