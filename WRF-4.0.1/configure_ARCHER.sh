#!/bin/bash
module load cray-netcdf/4.3.2
export WRFIO_NCD_LARGE_FILE_SUPPORT=1

export WRF_CHEM=1
export WRF_EM_CORE=1
export WRF_NMM_CORE=0

export NETCDF=/opt/cray/netcdf/4.3.2/intel/140
./configure

