## Structure of this project:

### Folders that put images:
 - **input** : input image
 - **mask1** : mask of the 1st epoch
 - **input2** : input of the 2nd epoch (also output of ist epoch)
 - **mask2** : mask of the 2nd epoch
 - **output** : final output
 
### Folders that put intermediates:
 - **CRAFT_result** : results of CRAFT
 - **segmentation_of_input** : results of segment-anything with input
 - **segmentation_of_input2** : results of segment-anything with input2

### Folders that contain codes:
 - **CRAFT-pytorch** : The model to find words.  (https://github.com/clovaai/CRAFT-pytorch)
 - **lama** : The model to clean words. (https://github.com/advimman/lama)
 - **segment-anything** : The model to do segmentation. (https://github.com/facebookresearch/segment-anything)

### Bash files to process:
 - **run1.sh** : For 1st epoch of lama
 - **run2.sh** : For segmentation and mask generation for 2nd epoch
 - **run3.sh** : For 2nd epoch of lama

### Flowchart:
 - **flowchart.png** : shows the structure of this project


## How to use this:
 - download necessary packages according to the github links of the folders above
   (for lama environment, use virtualenv instead of conda (there will be a folder called **lama/inpenv**) )
 - download CRAFT model from https://drive.google.com/file/d/1Jk4eGD7crsqCCg9C9VjCLkMN3ze8kutZ/view and put it in CRAFT-pytorch/weights
 - download lama model from https://huggingface.co/smartywu/big-lama/resolve/main/big-lama.zip and unzip it as lama/big-lama
 - download segment-anything model from https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth and put it in segment-anything/
 - Run this code
 ```
 bash run1.sh
 bash run2.sh
 bash run3.sh
 ```
