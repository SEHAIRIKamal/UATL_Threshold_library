# UATL_Threshold_library
A Matlab image threshold Library

![Release](https://img.shields.io/badge/Release-1.0.0-red.svg) ![License](https://img.shields.io/badge/License-MIT-green.svg) ![Platform](https://img.shields.io/badge/Platform-Windows-blue.svg) ![Algorithms](https://img.shields.io/badge/Algorithms-11-black.svg)

Last page update 21-03-2020

The UATL_Threshold_library is an image threshold library developed by Dr. Sehairi Kamal, in 2014, at University of Ammar Telidji of Laghouat (UATL). 
It contains 13 image threshold algorithms (local and global) implemented using Matlab. 
The library is tested on Matlab 2015 and higher.
The algorithms are written from scratch. All scripts are not vectorized and are not fully optimized.
All implementations are written in simple manner to be easily understood.

## List of methods

### Clustering-based methods

  1. Otsu’s Threshold Method
  
N. Otsu, ‘‘A threshold selection method from gray level histograms,’’ IEEE Trans. Syst. Man Cybern. SMC-9, 62–66 (1979).

  2. Iterative selection (or ISODATA/ Minimum error thresholding)
  
T. W. Ridler and S. Calvard,” Picture Thresholding Using an Iterative Selection Method”, IEEE Transactions On Systems, Man, And Cybernetics, Vol. sMC-8, NO. 8, AUGUST (1978).

### Entropy-based methods

  3. Kapur’s threshold method
  
J. N. Kapur, P. K. Sahoo, and A. K. C. Wong, “A new method for gray-level picture thresholding using the entropy of the histogram”, Graph. Models Image Process. 29, 273–285, (1985).

  4. Yen’s threshold method
  
J. C. Yen, F. J. Chang, and S. Chang, ‘‘A new criterion for automatic multilevel thresholding,’’ IEEE Trans. Image Process. IP-4, 370–378~1995!.

  5. Brink’s threshold method
  
A. D. Brink and N. E. Pendock, ‘‘Minimum cross entropy threshold selection,’’ Pattern Recogn. 29, 179–188 ~1996

### Histogram shape-based methods

   6. Ramesh’s Threshold Method

N. Ramesh, J. H. Yoo, and I. K. Sethi, “Thresholding based on histogram approximation”, IEEE Proc. Vision Image Signal Process. 142(5), 271–279, (1995).

### Attribute-based methods

  7. Tsai’s threshold method (moment-preserving method)

W. H. Tsai, ‘‘Moment-preserving thresholding: A new approach,’’ Graph. Models Image Process. 19, 377–393,(1985).
  
### Local methods
  8. Nick threshold method

Khurram Khurshid, Imran Siddiqi, Claudie Faure, and Nicole Vincent "Comparison of Niblack inspired binarization methods for ancient documents", Proc. SPIE 7247, Document Recognition and Retrieval XVI, 72470U (19 January 2009); doi.org/10.1117/12.805827

   9. Niblack’s threshold method

W.Niblack, An Introduction to Digital Image Processing. Prentice Hall, Englewood Cliffs, (1986).

   10. Sauvola’s threshold method 

J.Sauvola, T,Seppanen, S.Haapakoski, M.Pietikainen, “Adaptive Document Binarization”, 4th Int. Conf. On Document Analysis and Recognition, Ulm, Germany, pp.147-152 (1997).

  11. Wolf’s threshold method

C. Wolf, J-M. Jolion, “Extraction and Recognition of Artificial Text in Multimedia Documents”, Pattern Analysis and Applications, 6(4):309-326, (2003).


## How to use

1. Add your image to the same folder 

2. Change the `imread` instruction to `im1=imread('NameOfYourImage.Your ImageFileFormat');`

3. Simply! Run the script. Enjoy!

## Citation

If you use this library, please cite it as:

K. Sehairi, F. Chouireb and J. Meunier, "Comparison study between different automatic threshold algorithms for motion detection," 2015 4th International Conference on Electrical Engineering (ICEE), Boumerdes, 2015, pp. 1-8. doi: 10.1109/INTEE.2015.7416840
```
@INPROCEEDINGS{7416840,
author={K. {Sehairi} and F. {Chouireb} and J. {Meunier}},
booktitle={2015 4th International Conference on Electrical Engineering (ICEE)},
title={Comparison study between different automatic threshold algorithms for motion detection},
year={2015},
volume={},
number={},
pages={1-8},
keywords={image motion analysis;image segmentation;object detection;video surveillance;automatic threshold algorithms;motion detection algorithm;global thresholding methods;surveillance applications;pixel-based evaluation;Motion detection;Histograms;Lead;Iterative methods;Video surveillance;Entropy;Optical filters;Segmentation;global thresholding;motion detection;surveillance;performance evaluation},
doi={10.1109/INTEE.2015.7416840},
ISSN={null},
month={Dec},} 
```

## Download PDF

https://ieeexplore.ieee.org/document/7416840 

https://www.researchgate.net/publication/299430313_Comparison_study_between_different_automatic_threshold_algorithms_for_motion_detection

[![Stargazers over time](https://starchart.cc/SEHAIRIKamal/A-Matlab-image-threshold-Library.svg)](https://starchart.cc/SEHAIRIKamal/A-Matlab-image-threshold-Library)
