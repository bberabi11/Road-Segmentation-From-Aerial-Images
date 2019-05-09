#!/bin/bash

OPTION=$1

if [ "$OPTION" == "send" ]; then
    bsub -n 4 -W 4:00 -R "rusage[mem=4096, ngpus_excl_p=1]" python cil.py
elif [ "$OPTION" == "watch" ]; then
    watch -n 1 bjobs
elif [ "$OPTION" == "gpu" ]; then
    module load gcc/4.8.5 python_gpu/3.6.4 hdf5 eth_proxy
elif [ "$OPTION" == "cpu" ]; then
    module load gcc/4.8.5 python_cpu/3.6.4 hdf5 eth_proxy
elif [ "$OPTION" == "submit" ]; then
	FNAME=${2:-'./outdir/submission_resize.csv'} 
	MSG=${3:-'"Message"'} 
    kaggle competitions submit -c cil-road-segmentation-2019 -f $FNAME -m $MSG
else
    echo "Unknown option"
fi
