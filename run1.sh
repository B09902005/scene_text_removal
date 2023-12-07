rm CRAFT_result/*
rm mask1/*
rm input2/*

for file in input/*.jpg; do mv "$file" "${file%.jpg}.png"; done

# build the environment of lama
cd lama
virtualenv inpenv --python=/usr/bin/python3
source inpenv/bin/activate
export TORCH_HOME=$(pwd) && export PYTHONPATH=$(pwd)
cd ..

# CRAFT: the model that can detect words
python CRAFT-pytorch/test.py --trained_model=CRAFT-pytorch/weights/craft_mlt_25k.pth --test_folder=input --result_folder=CRAFT_result --cuda=False
python3 CRAFT-pytorch/mask.py --test_folder=CRAFT_result --result_folder=mask1

# run lama
cp input/* lama/input
cp mask1/* lama/input
python3 lama/bin/predict.py
cp lama/output/* input2
