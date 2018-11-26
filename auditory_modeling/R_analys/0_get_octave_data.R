# Import data saved as txt by Octave. These are 3D arrays with the following 
# dimensions:
# d1: 24 center frequencies, ERB spaced between 100 Hz and 8 kHz 
# d2: 5 variables, center frequency, ild, itd_p, itd2_p, itd_c
# d3: 8 ICIs = 0.125, 0.25, 0.5, 1, 2, 4, 8, 16


setwd("./octave_analys/")

library(foreign)  # Needed for octave import


## Import text-files as exported by Octave -------------------------------------
# Lag only
# itd_lag0 <- read.octave("itd_llr0.txt")$itd_llr0
# ild_lag0 <- read.octave("ild_llr0.txt")$ild_llr0
# 
# itd_lagp10 <- read.octave("itd_llp10.txt")$itd_llp10
# ild_lagp10 <- read.octave("ild_llp10.txt")$ild_llp10
# 
# itd_lagm10 <- read.octave("itd_llrm10.txt")$itd_llrm10
# ild_lagm10 <- read.octave("ild_llrm10.txt")$ild_llrm10
# 
# itd_lagm20 <- read.octave("itd_llrm20.txt")$itd_llrm20
# ild_lagm20 <- read.octave("ild_llrm20.txt")$ild_llrm20

# Lag+lead (prefix: z)
itd_lag0 <- read.octave("itd_llr0.txt")$itd_llr0
ild_lag0 <- read.octave("ild_llr0.txt")$ild_llr0

itd_lagp10 <- read.octave("itd_llrp10.txt")$itd_llrp10
ild_lagp10 <- read.octave("ild_llrp10.txt")$ild_llrp10

itd_lagm10 <- read.octave("itd_llrm10.txt")$itd_llrm10
ild_lagm10 <- read.octave("ild_llrm10.txt")$ild_llrm10

itd_lagm20 <- read.octave("itd_llrm20.txt")$itd_llrm20
ild_lagm20 <- read.octave("ild_llrm20.txt")$ild_llrm20
## -----------------------------------------------------------------------------

setwd("..")
