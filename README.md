# Dask
Dask is a framework for computing data flow graphs.  It contains a number of data
structures that have operations defined on them that are translated to data flow
graphs by Dask itself.  It is also possible to create and compute your own graphs.

Dask can be used for out-of-core computations on very large data sets, stored in
CSV or HDF5 files.

These files are copied from https://github.com/gjbex/Python-for-HPC/tree/master/source-code/dask

# What is it?
* `create_csv_data.py`: non-Dask script to generate a large CSV data set for
    experimenting with Dask.
* `create_csv_data.pbs`: PBS script to run `create_csv_data.py`.
* `dask_avg_csv.py`: Dask computation of the average value of columns in
    a large number of CSV files.
* `dask_avg_csv.pbs`: PBS script to run `dask_avg_csv.py`.
* `dask_distr_avg_csv.py`: Dask computation of the average value of columns in
    a large number of CSV files, it creates a client for distributed execution
    of `DataFrame` operations.
* `dask_distr_avg_csv.pbs`: PBS script to run `dask_distr_avg_csv.py`,
    launches a scheduler and workers for the client to connect to.
* `launch_scheduler.sh`: Bash script to launch a Dash scheduler for
    distributed computations. Dash workers can connect to it and
    receive work.
* `launch_worker.sh`: Bash script to launch a Dask worker on a
	compute node.
* `dask_distr_test.py`: script to perform a trivial computation using
    futures in a distributed setting.
* `dask_distr_test.pbs`: PBS script that will launch a scheduler, workers,
    and run the `dask_distr_test.py` script.
* `dask_sum_aarays.py`: somewhat artificial example of a Dask computation
    on `numpy` arrays.
* `dask_sum_aarays.pbs`: PBS script to execute `dask_sum_aarays.py`.
* `julia_set`: example of combining Cython and dask.

* [etijskens] `setenv.sh` bash script for adding the location of `path/to/your/miniconda3/bin` to the 
  `PATH` environment variable

# adapting the scripts to your environment [etijskens]

* In `setenv.sh` make sure that the `path/to/your/miniconda3/bin` location is prepended to the `PATH` 
  environment variable.

* In `launch_scheduler.sh` and `launch_worker.sh` make sure that 
    
  1. `setenv.sh` is sourced. You must specify the full path!

  2. the correct conda environment is activated. Obviously this environment must be part of the 
     `miniconda3` installation referred to in `setenv.sh`. 

* The `.pbs` job scripts pass the scheduler_node and the scheduler_port to the python script
  via command line arguments. Since they are in fact also stored in environment variables, 
  you might as well retrieve them in the python script as 

      import os
      scheduler_node = os.environ['scheduler_node']
      scheduler_port = os.environ['scheduler_port']
