## Script for analyses of stimuli in experiment ALEXIS 109, ussing the Auditory Modeling Toolbox.
## The user made function cc() use different functions in AMT half wave rectifying, 
## depending on parameter ihc (0 or 1).
## To change selection of frequency bands, change in cc(). See help for these 
# functions for further details (e.g.,   help cc in Octave command window)
##
## Revised: MN 2018-11-26

## Prepare stuff ---------------------------------------------------------------
clear all

# Add path to folder with Auditory Modeling Toolbox is installed
addpath("C:/Users/MATNI/Documents/amtoolbox-full-0.9.9/code")

amt_start  ## Comment out once toolbox started
pkg load signal  # For xcorr(), cross-correlation function
## -----------------------------------------------------------------------------


## Set ICIs to be analysed -----------------------------------------------------
ici_cond = [0.125, 0.25, 0.5, 1, 2, 4, 8, 16];
ihc = 1  # 1 = Use function ichenvelope() for half-wave rectifying, see function cc()
## -----------------------------------------------------------------------------


## Analyze lead+lag stimui and save output in .txt files -----------------------

## LLR = +10 dB
itd_llrp10 = cc(ici_cond = ici_cond, llr_db = 10,   ild_db = 0, itd_ms = -0.35, 
                lagonly = 0, ihc = ihc)
ild_llrp10 = cc(ici_cond = ici_cond, llr_db = 10, ild_db = -10, itd_ms =  0.0, 
                 lagonly = 0, ihc = ihc)
save itd_llrp10.txt   itd_llrp10 -text
save ild_llrp10.txt   ild_llrp10 -text

## LLR = 0 dB
itd_llr0 = cc(ici_cond = ici_cond, llr_db = 0,   ild_db = 0, itd_ms = -0.35, 
              lagonly = 0, ihc = ihc)
ild_llr0 = cc(ici_cond = ici_cond, llr_db = 0, ild_db = -10, itd_ms =  0.0,  
              lagonly = 0, ihc = ihc)
save itd_llr0.txt   itd_llr0 -text
save ild_llr0.txt   ild_llr0 -text

## LLR = -10 dB
itd_llrm10 = cc(ici_cond = ici_cond, llr_db = -10,   ild_db = 0, itd_ms = -0.35, 
              lagonly = 0, ihc = ihc)
ild_llrm10 = cc(ici_cond = ici_cond, llr_db = -10, ild_db = -10, itd_ms =  0.0,  
              lagonly = 0, ihc = ihc)
save itd_llrm10.txt   itd_llrm10 -text
save ild_llrm10.txt   ild_llrm10 -text

## LLR = -20 dB
itd_llrm20 = cc(ici_cond = ici_cond, llr_db = -20,   ild_db = 0, itd_ms = -0.35, 
              lagonly = 0, ihc = ihc)
ild_llrm20 = cc(ici_cond = ici_cond, llr_db = -20, ild_db = -10, itd_ms =  0.0,  
              lagonly = 0, ihc = ihc)
save itd_llrm20.txt   itd_llrm20 -text
save ild_llrm20.txt   ild_llrm20 -text
## -----------------------------------------------------------------------------

