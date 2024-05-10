
# Gray Matter Segmentator
This repository contains a Gray Matter(GM) segmentator implementation for the MATLAB Platform based on **SPM12** and **CAT12**. This tool was designed specifically for the preprocessing of the images for the [**Diagonal Sulcus Dectection repository**](https://github.com/hkulsgaard/sulcus). All credits to the creators of those amazing toolboxes.

## Content
1. [Installation](#Installation)
    * [Standalone Version](#Standalone-Version)
    * [Matlab Platform](#Matlab-Platform)
2. [How to run](#How-to-run)
3. [Compile Standalone](#Compilation-Standalone)

## Installation

### Standalone Version
1. Download MATLAB Runtime version 9.5 (R2018b) from [the official site](https://www.mathworks.com/products/compiler/matlab-runtime.html) for your specific SO (Windows, Linux, Mac).
2. Install the "MCR_R2018b" file downloaded.
3. If you are using Windows, download the standalone executable version. Otherwise, compile it for your system following the steps described in [Compilation Section](#Compilation).

### Matlab Platform
1. Download and install the **Matlab 9.5 Matlab R2018b** (Recommended)
2. Download and install [**SPM12  v7771**](https://www.fil.ion.ucl.ac.uk/spm/software/download/) addon for Matlab.
3. Download and install [**CAT12.9 (r2560)**](https://www.neuro.uni-jena.de/cat12/cat12_r2560.zip) toolbox for SPM.

>For more information about how to install those complements, please refer to the official website of [SPM](https://www.fil.ion.ucl.ac.uk/spm/docs/installation/) and [CAT12](https://neuro-jena.github.io/cat/index.html#DOWNLOAD)

## How to run

1. In the **Standalone version**, execute `SegmentGM.exe`. 
   
   In the **Matlab Platform**, open `run_segment_gm.m` and run it.

1. Execute `SegmentGM.exe` and wait it to load.
2. A dialog box will pop out to select the nifti images that you want to segment.
3. Results will be placed in a folder called `mri`, located alongside the input images. GM segments will be named as the input images with the `wp1` prefix.

### Notes
- Input images can be in `.nii` and `.nii.gz` format.
- It takes aproximately 10~15min to process each image.
- The processing is CPU intensive.
- You can run several instances of the segmentator if you want to do it more quickly, however keep in mind that is going to consume more CPU and memory RAM.
- Terminal outputs will be stored in the `output.txt` file or the individual ones in the `report` folder

## Compile Standalone

As a prerequisite, follow the instructions for installation for the [Matlab Platform](#Matlab-Platform).

In order to compile the GM segmentator, follow this steps:
1. Clone this repository.
2. (Optional) Download the corresponding [7Zip version](https://www.7-zip.org/download.html) for your SO and extract the content inside the provided `7zip` folder.
3. Open the script `compile_segment_gm.m` in MATLAB and run it.
4. The compiled version will be located in the `compiled` folder.