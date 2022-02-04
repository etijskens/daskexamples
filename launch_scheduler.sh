#!/bin/bash

source "${VSC_SCRATCH}/daskexamples/setenv.sh"
source activate elmo-env 2> /dev/null
if [ $? -ne 0 ]
then
    (>&2 echo '### error: conda environment not sourced correctly' )
fi

nohup dask-scheduler &> "scheduler-${PBS_JOBID}.log" &
