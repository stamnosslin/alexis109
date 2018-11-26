Auditory Modeling of lead-lag click pairs

This folder contain files used for the auditory modeling described 
in a manuscript submitted to journal. The stimuli were from the listening 
experiment Alexis109, the psychophysical data of wich is available in the 
R-library alexis109 (devtools::install_github("stamnosslin/alexis109"))

Content:

./octave_analys ----------------------------------------------------------------

Modeling code (*.m) and output (*.txt). Octave code is based on functions in the 
Auditory Modeling Toolbox.

The type fo analyzed stimulus is given by the name of the output files. 
e.g., ild_llr0   mean ILD-only, LLR = 0 dB;
      itd_llrp10 mean ITD-only, LLR = +10 dB 
      ild_llrm20 mean ILD-only, LLR = -20 dB, etc.

The output files are 3-dimensional arrays (ici x cf x output).

ici = 8 matrices, one for each of these inter-click-intervals (ICI): 
      0.125, 0.25, 0.5, 1, 2, 4, 8, 16 ms
cf = 31 rows: gammatone center-frequency
output = 5 columns: gammatone center-frequency, peak-crosscorr-unrestr, 
                    peak-cross-corr-restr, ild, centroid-crosscorr 
                    
                    
./R_analys ---------------------------------------------------------------------
R code (*.R) for illustrating the model output (imports .txt data from /octave_analys), 
and figures (*.pdf) for stimuli with various inter-click-intervals.

To recreate the manuscript's Figure 4, run profile_plot_per_llr.R (set ici <- 4)



---
MN 2018-11-26

