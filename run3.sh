rm output/*
rm lama/input/*
rm lama/output/*

# build the environment of lama
cd lama
virtualenv inpenv --python=/usr/bin/python3
source inpenv/bin/activate
export TORCH_HOME=$(pwd) && export PYTHONPATH=$(pwd)
cd ..

# run lama
cp input2/* lama/input
cp mask2/* lama/input
python3 lama/bin/predict.py
cp lama/output/* output
