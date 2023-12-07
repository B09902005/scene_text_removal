rm segmentation_of_input/*
rm segmentation_of_input2/*
rm mask2/*

# run segmentation for input and the image after lama
cd segment-anything
python3 scripts/amg.py --checkpoint "sam_vit_h_4b8939.pth" --model-type "default" --input "../input" --output "../segmentation_of_input" --device "cpu"
python3 scripts/amg.py --checkpoint "sam_vit_h_4b8939.pth" --model-type "default" --input "../input2" --output "../segmentation_of_input2" --device "cpu"

# generate mask for the 2nd epoch
cd ..
python3 segment-anything/mask.py --input1 "segmentation_of_input" --input2 "segmentation_of_input2" --output "mask2"
