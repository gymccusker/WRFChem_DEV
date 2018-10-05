#!/bin/bash --login
# uncomment the following two lines if you need to debug this script
# set -v      # Print script lines as they are read.
# set -x      # Print commands and their arguments as they are executed.
# PBS job options (name, compute nodes, job time)
#PBS -N wrf_exe
#PBS -l select=9
#PBS -l walltime=24:00:00
#PBS -A n02-NEK01482X
#PBS -M giyoung@bas.ac.uk
#PBS -m b
#PBS -m e
module load cray-netcdf/4.3.2
module load cray-hdf5/1.8.14          # for WRFV3.5.1 and above

export TMPDIR=/home/n02/n02/mbexkgy2/tmp

export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export WRF_CHEM=1
export WRF_EM_CORE=1
export WRF_NMM_CORE=0

export NETCDF=/opt/cray/netcdf/4.3.2/intel/140

# Increase stack size
ulimit -s unlimited

# Make sure any symbolic links are resolved to absolute path
export PBS_O_WORKDIR=$(readlink -f $PBS_O_WORKDIR)               
# Change to the directory that the job was submitted from
# (remember this should be on the /work filesystem)
cd $PBS_O_WORKDIR
# Set the number of threads to 1
#   This prevents any system libraries from automatically 
#   using threading.
export OMP_NUM_THREADS=1
# Launch the parallel job
aprun -n 216 ./wrf.exe arg1 arg2
