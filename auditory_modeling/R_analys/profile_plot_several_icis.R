# Draw profile plot: Band-specific model outputs (itds or ilds) separately for
# each center frequency

## Clear everything -------------------------------------------------------------
rm(list = ls()) # clear memory
graphics.off()  # clear all plots
cat("\014")     # clear console (same as Ctrl-L in console)
#-------------------------------------------------------------------------------


library(alexis109) # To obtain data on percent correct responses
source("R_analys/0_get_octave_data.R")
source("R_analys/1_functions.R")

plotici <- function(ici) {
# This function plots results for a specific ICI, in teh same way as 
# the script profile_plot_per_llr.R plotted it for ICI = 4 ms (with the exception
# that this function does not generat a table insert with performance data)
  
filename <- sprintf("ici%s", ici)  
  
## Decide how to save figure ---------------------------------------------------
savefig = 1  # 0 = dont save, show in Rstudio, 1 = pdf, 2 = png

# Open pdf (paper = 'letter' or 'A4' to get fig on full page)
if(savefig == 1) {
  pdf(paste("R_analys/", filename, '.pdf', sep = ''), 
      width = 15/2.54, height = 23/2.54, paper = 'letter')
}

# Open png 
if(savefig == 2) {
  png(paste("R_analys/", filename, '.png', sep = ''), 
      units = "in", res = 600, width = 15/2.54, height = 23/2.54)
}
## -----------------------------------------------------------------------------


## Define ICI to be analyzed ---------------------------------------------------
# ici <- 4  # Set this one!

icis <- c(0.125, 0.25, 0.5, 1, 2, 4, 8, 16)  # These eight were analysed by Octave-AMT
tau <- which(icis == ici)  # Ths one gets into the function 

itdlegend <- sprintf("ITD-only, ICI = %s ms", ici)
ildlegend <- sprintf("ILD-only, ICI = %s ms", ici)
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

ytext_itd <- expression(paste("Model output: Band-specific ", italic("itd"), " [ms]"))
ytext_ild <- expression(paste("Model output: Band-specific ", italic("ild"), " [dB]"))

## LLR = +10 dB (row 1) --------------------------------------------------------
itd <-  itd_lagp10
ild <-  ild_lagp10

# Left
par(fig = pp[1, ]) 
profile_plot(itd = itd, ild = ild, cc = 4, mici = tau)
#mtext('Model output: Band-specific itd [ms]', 2, line = 0.5, cex = 0.6)
mtext(ytext_itd, 2, line = 0.5, cex = 0.6)
text(4.5, 1.1, pos = 3, font = 3, labels = "LLR = +10 dB", cex = 0.4)
#addpc(llr = 10)

# Right
par(fig = pp[2, ], new = TRUE) 
profile_plot(itd = itd, ild = ild, cc = 2, mici = tau)
mtext(ytext_ild, 2, line = 0.4, cex = 0.6)

# Legend
lines(c(19.5, 21.5), c(11, 11), lty = 2, lwd = 0.4)
text(21, 11, labels = itdlegend, cex = 0.3, pos = 4)
lines(c(19.5, 21.5), c(10, 10), lty = 1, lwd = 0.4)
text(21, 10, labels = ildlegend, cex = 0.3, pos = 4)
## -----------------------------------------------------------------------------


## LLR = 0 dB (row 2) ----------------------------------------------------------
itd <-  itd_lag0
ild <-  ild_lag0

# Left
par(fig = pp[3, ], new = TRUE)
profile_plot(itd = itd, ild = ild, cc = 4, mici = tau)
mtext(ytext_itd, 2, line = 0.5, cex = 0.6)
text(4.5, 1.1, pos = 3, font = 3, labels = "LLR = 0 dB", cex = 0.4)
#addpc(llr = 0)

# Right
par(fig = pp[4, ], new = TRUE)
profile_plot(itd = itd, ild = ild, cc = 2, mici = tau)
mtext(ytext_ild, 2, line = 0.4, cex = 0.6)
## -----------------------------------------------------------------------------


## LLR = -10 dB (row 3) --------------------------------------------------------
itd <-  itd_lagm10
ild <-  ild_lagm10

# Left
par(fig = pp[5, ], new = TRUE) 
profile_plot(itd = itd, ild = ild, cc = 4, mici = tau)
mtext(ytext_itd, 2, line = 0.5, cex = 0.6)
text(4.5, 1.1, pos = 3, font = 3, labels = "LLR = -10 dB", cex = 0.4)
#addpc(llr = -10)

# Right
par(fig = pp[6, ], new = TRUE) 
profile_plot(itd = itd, ild = ild, cc = 2, mici = tau)
mtext(ytext_ild, 2, line = 0.4, cex = 0.6)
## -----------------------------------------------------------------------------


## LLR = -30 dB (row 4) --------------------------------------------------------
itd <-  itd_lagm20
ild <-  ild_lagm20

# Left
par(fig = pp[7, ], new = TRUE)
profile_plot(itd = itd, ild = ild, cc = 4, mici = tau)
mtext(ytext_itd, 2, line = 0.5, cex = 0.6)
mtext('Gammatone-filter center-frequency [kHz]', 1, line = 0.2, cex = 0.6)
text(4.5, 1.1, pos = 3, font = 3, labels = "LLR = -20 dB", cex = 0.4)
#addpc(llr = -20)

# Right
par(fig = pp[8, ], new = TRUE)
profile_plot(itd = itd, ild = ild, cc = 2, mici = tau)
mtext(ytext_ild, 2, line = 0.4, cex = 0.6)
mtext('Gammatone-filter center-frequency [kHz]', 1, line = 0.2, cex = 0.6)
## -----------------------------------------------------------------------------


## Close pdf or png ------------------------------------------------------------
if(savefig > 0){
  graphics.off() 
}
# ------------------------------------------------------------------------------

}


## Plot for several icis ------------------------------------------------------
to_be_ploted <- c(0.125, 0.25, 0.5, 1, 2, 4, 8)
sapply(to_be_ploted , plotici)
## -----------------------------------------------------------------------------