# Draw profile plot: Band-specific model outputs (itds or ilds) separately for
# each center frequency

source("R_analys/0_get_octave_data.R")
source("R_analys/1_functions.R")

## Decide how to save figure ---------------------------------------------------
savefig = 1  # 0 = dont save, show in Rstudio, 1 = pdf, 2 = png

# Open pdf (paper = 'letter' or 'A4' to get fig on full page)
if(savefig == 1) {
  pdf("R_analys/profile_per_ici_fig.pdf", width = 15/2.54, height = 23/2.54, paper = 'letter')
}

# Open png 
if(savefig == 2) {
  png("R_analys/profile_per_ici_fig.png", units = "in", res = 600, width = 15/2.54, height = 23/2.54)
}
## -----------------------------------------------------------------------------


## Function to find matrix that contained specified ICI -----------------------
tau <- function(ici) {
  # These eight were analysed by Octave-AMT
  icis <- c(0.125, 0.25, 0.5, 1, 2, 4, 8, 16)  
  # This is the number of the relevant slice of the 3D array of Octave data
  out <- which(icis == ici)  
  out
}
## -----------------------------------------------------------------------------


## -----------------------------------------------------------------------------


## Define subplot positions and set margins ------------------------------------
pp <- matrix( c( 0/1, 1/2, 3/4,  1/1,  # row 1 left
                 1/2, 1/1, 3/4,  1/1,  # row 1 right
                 0/1, 1/2, 2/4,  3/4,  # row 2 left
                 1/2, 1/1, 2/4,  3/4,  # row 2 right
                 0/1, 1/2, 1/4,  2/4,  # row 3 left 
                 1/2, 1/1, 1/4,  2/4,  # row 3 right
                 0/1, 1/2, 0/1,  1/4,  # row 4 left 
                 1/2, 1/1, 0/1,  1/4), # row 4 right
                 nrow = 8, ncol = 4, byrow = TRUE)

par(mar = c(1.2,2,0,0))
## -----------------------------------------------------------------------------


## Define LLR by selecting data files ------------------------------------------
itd <-  itd_lag0
ild <-  ild_lag0
itdlegend <- "ITD-only, LLR = 0 dB"
ildlegend <- "ILD-only, LLR = 0 dB"
## -----------------------------------------------------------------------------


## ICI = 0.5 ms (row 1) --------------------------------------------------------

# Left
par(fig = pp[1, ]) 
profile_plot(itd = itd, ild = ild, cc = 4, mici = tau(0.5))
mtext('Model output: Band-specific itd [ms]', 2, line = 0.5, cex = 0.6)
text(4.5, 1.1, pos = 3, font = 3, labels = "ICI = 0.5 ms", cex = 0.4)

# Right
par(fig = pp[2, ], new = TRUE) 
profile_plot(itd = itd, ild = ild, cc = 2, mici = tau(0.5))
mtext('Model output: Band-specific ild [dB]', 2, line = 0.4, cex = 0.6)

# Legend
lines(c(19.5, 21.5), c(11, 11), lty = 2, lwd = 0.4)
text(21, 11, labels = itdlegend, cex = 0.3, pos = 4)
lines(c(19.5, 21.5), c(10, 10), lty = 1, lwd = 0.4)
text(21, 10, labels = ildlegend, cex = 0.3, pos = 4)
## -----------------------------------------------------------------------------


## ICI = 1 ms (row 2) --------------------------------------------------------

# Left
par(fig = pp[3, ], new = TRUE)
profile_plot(itd = itd, ild = ild, cc = 4, mici = tau(1))
mtext('Model output: Band-specific itd [ms]', 2, line = 0.5, cex = 0.6)
text(4.5, 1.1, pos = 3, font = 3, labels = "ICI = 1 ms", cex = 0.4)

# Right
par(fig = pp[4, ], new = TRUE)
profile_plot(itd = itd, ild = ild, cc = 2, mici = tau(1))
mtext('Model output: Band-specific ild [dB]', 2, line = 0.4, cex = 0.6)
## -----------------------------------------------------------------------------


## ICI = 2 ms (row 3) --------------------------------------------------------

# Left
par(fig = pp[5, ], new = TRUE) 
profile_plot(itd = itd, ild = ild, cc = 4, mici = tau(2))
mtext('Model output: Band-specific itd [ms]', 2, line = 0.5, cex = 0.6)
text(4.5, 1.1, pos = 3, font = 3, labels = "ICI = 2 ms", cex = 0.4)

# Right
par(fig = pp[6, ], new = TRUE) 
profile_plot(itd = itd, ild = ild, cc = 2, mici = tau(2))
mtext('Model output: Band-specific ild [dB]', 2, line = 0.4, cex = 0.6)
## -----------------------------------------------------------------------------


## ICI = 4 msB (row 4) --------------------------------------------------------

# Left
par(fig = pp[7, ], new = TRUE)
profile_plot(itd = itd, ild = ild, cc = 4, mici = tau(4))
mtext('Model output: Band-specific itd [ms]', 2, line = 0.5, cex = 0.6)
mtext('Center frequency [kHz]', 1, line = 0.2, cex = 0.6)
text(4.5, 1.1, pos = 3, font = 3, labels = "ICI = 4 ms", cex = 0.4)

# Right
par(fig = pp[8, ], new = TRUE)
profile_plot(itd = itd, ild = ild, cc = 2, mici = tau(4))
mtext('Model output: Band-specific ild [dB]', 2, line = 0.4, cex = 0.6)
mtext('Center frequency [kHz]', 1, line = 0.2, cex = 0.6)
## -----------------------------------------------------------------------------


## Close pdf or png ------------------------------------------------------------
if(savefig > 0){
  graphics.off() 
}
# ------------------------------------------------------------------------------