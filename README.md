# alexis109
This R library contains data from an experiment (called alexis109) on lateralization and detection of lag-clicks in lead-lag click pairs. This is data described in Nilsson, M.E., Tirado, C., and Szychowska, M. (2019). Psychoacoustic evidence for stronger discrimination suppression of spatial information conveyed by lag-click interaural time than interaural level differences. Accepted for publication in *The Journal of the Acoustical Society of America*.

To install the data as an R-package, first install the **devtools** library, then:  

devtools::install_github("stamnosslin/alexis109")

The library alexis109 contains three raw data sets:

+ **data109lat**, data from three listeners on lateralization of lag clicks
+ **data109det**, data from the same three listeners on detection of lag clicks
+ **data109rov**, data from the same thee listeners and two more on lateralization of lag clicks, including one condition with level roving (this was an extra experiment to check the usefulness of monaural cues for lateralization of inter-aural level differences)

For each of these, there are one data file with processed data, i.e., estimated thresholds used for drawing Fig. 3 of the submitted manuscript:

+ **ths_lat**, thresholds for the lateralization experiment
+ **ths_det**, thresholds for the detection experiment
+ **ths_rove**, thresholds for the roving experiment

Thresholds were estimated using Hamiltonian Monte Carlo, as described in the manuscript.

Note that data files uses id number 2001, 2002, and 2003 for listener MS, CT and CS, respectively. ID-numbers 2005 and 2006 in the 
data files of the additional experiment (with and without level roving) refer to listener EE and IO. 

**Auditory modeling.** The folder ./auditory_modeling contains Octave and R code used for modeling of selected experimental stimuli, as described in the Result section of the manuscript (Section IV.B). The modeling was based on functions from *The Auditory Modeling Toolbox* http://amtoolbox.sourceforge.net/. The folder also contain model output (txt-files) and one file with additional figures **additional_modeling_figs.pdf** not included in the manuscript. Note that this material is not part of the R-package alexis109, so it has to be downloaded separately.
