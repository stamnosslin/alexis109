# alexis109
This R library contains data from an experiment (called alexis109) on lateralization and detection of lag-clicks in lead-lag click pairs. This is data for a manuscript *submitted* to a journal (submission date 2018-08-08).  

To install as R-package, first install the **devtools** library, then:  

devtools::install_github("stamnosslin/alexis109")

The library contains three raw data sets:

+ **data109lat**, data from three listeners on lateralization of lag clicks
+ **data109det**, data from the same thre listeners on detection of lag clicks
+ **data109rov**, data from the same thre listeners and two more on laterlization of lag clicks, including one condition with level roving (this was an extra experiment to check the usefulness of monaural cues for laterlization of inter-aural level differences)

For each of these, there are one data file with processed data, i.e., estimated thresholds used for drawing Fig. 3 of the submitted manuscript:

+ **ths_lat**, thresholds for the laterlization experiment
+ **ths_det**, thresholds for the detection experiment
+ **ths_rove**, thresholds for the roving experiment

Threholds were estimated using Hamiltonian Monte Carlo, as described in the manuscript.

Note that data files uses id number 2001, 2002, and 2003 for listener MS, CT and CS, respectively. ID-numbers 2005 and 2006 in the 
data files of the additional experiment (with and without level roving) refer to listener EE and IO. 

**Audioty modeling.** The folder ./auditory_modeling contains Octave and R code used for modeling of selected experimental stimuli, as described in the Result section of the manuscript. The modeling was based on functions from *The Audioty Modeling Toolbox* http://amtoolbox.sourceforge.net/. The folder also contain model output (txt-files) and figure (pdf-files). Note that this material is not included ion the R-package alexis109, so it has to be downloaded separately.
