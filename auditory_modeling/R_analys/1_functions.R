# Plotting functions

## statistics funcions ---------------------------------------------------------
# takes octave-imported 3d array and spits out data frame with specified stat for 
# ild, itd_p, and itd_c
stat <- function(x, FUN = mean) {
  ici <- c(0.125, 0.25, 0.5, 1, 2, 4, 8, 16)
  d <- data.frame(ici = rep(0, 8), 
                  ild_rms = rep(0, 8), 
                  itd_p = rep(0, 8), 
                  itd_c = rep(0, 8))
  
  for (j in 1:8) {
    d[j, 1] <- ici[j]
    d[j, 2:4] <- apply(x[, 2:4, j], 2, FUN)
  }
  d
}


q25 <- function(x) {quantile(x, probs = 0.25)}

q75 <- function(x) {quantile(x, probs = 0.75)}
## -----------------------------------------------------------------------------


## qplot_ild() plot median and iqr across 30 frequncy bands for ilds -----------
qplot_ild <- function(itd = itd_lag, ild = ild_lag) {
  ici <- log2(stat(itd)[,1])
  sitd25 <- stat(itd, FUN = q25)[, 2]  # ILDs
  sitd50 <- stat(itd, FUN = median)[, 2]
  sitd75 <- stat(itd, FUN = q75)[, 2]
  sild25 <- stat(ild, FUN = q25)[, 2]
  sild50 <- stat(ild, FUN = median)[, 2]
  sild75 <- stat(ild, FUN = q75)[, 2]
  
  ylim <- c(-10, 5)
  xlim <- c(-3.5, log2(20))
  
  plot(ici, rep(0, 8), pch = '', xlim = xlim, ylim = ylim, xlab = "", 
       ylab = "", axes = FALSE)
  
  # ITD-only
  lines(ici, sitd50, lwd = 0.7, lty = 1)
  arrows(x0 = ici, x1 = ici, y0 = sitd25, y1 = sitd75, 
         length = 0.05, angle = 90, code = 3, col = 'grey', lwd = 0.6)
  points(ici, sitd50, pch = 22, bg = 'grey', cex = 0.8, lwd = 0.6)
  
  # ILD-only
  lines(ici, sild50, lwd = 0.5, lty = 2)
  arrows(x0 = ici, x1 = ici, y0 = sild25, y1 = sild75, 
         length = 0.05, angle = 90, code = 3, col = 'black', lty = 1, lwd = 0.6)
  points(ici, sild50, pch = 21, bg = 'grey', cex = 0.6, lwd = 0.4)
  
  axis(1, at = c(xlim[1], ici), 
       labels = c('', '.125', '.25', '.5', '1', '2', '4', '8', '16'), 
       cex.axis = 0.5, tck = 0.01, mgp = c(3, -0.2, 0), lwd = 0.5, pos = ylim[1])
  axis(2, at = -10:5, 
       labels = c('-10', '', '', '', '', '-5', '', '', '', '', '0', '', '', '', '', '5'), 
       cex.axis = 0.5, mgp = c(3, 0.2, 0), lwd = 0.5, tck = 0.01, las = 2,
       pos = xlim[1])
  }
## -----------------------------------------------------------------------------


## qplot_itd() plot median itd and iqr across 30 frequncy bands for itds -------
qplot_itd <- function(itd = itd_lag, ild = ild_lag) {
  ici <- log2(stat(itd)[,1])
  sitd25 <- stat(itd, FUN = q25)[, 4]  # Peak of cross corr
  sitd50 <- stat(itd, FUN = median)[, 4]
  sitd75 <- stat(itd, FUN = q75)[, 4]
  sild25 <- stat(ild, FUN = q25)[, 4]
  sild50 <- stat(ild, FUN = median)[, 4]
  sild75 <- stat(ild, FUN = q75)[, 4]
  
  ylim <- c(-0.4, 0.4)
  xlim <- c(-3.5, log2(20))
  
  # ItD-only
  plot(ici, rep(0, 8), pch = '', ylim = ylim, xlim = xlim, xlab = "",
       ylab = "", axes = FALSE)
  lines(ici, sitd50, lwd = 0.7, lty = 1)
  arrows(x0 = ici, x1 = ici, y0 = sitd25, y1 = sitd75, 
         length = 0.05, angle = 90, code = 3, col = 'grey', lwd = 0.6)
  points(ici, sitd50, pch = 22, bg = 'grey', cex = 0.8, lwd = 0.6)

  # ILD-only
  lines(ici, sild50, lwd = 0.5, lty = 2)
  arrows(x0 = ici, x1 = ici, y0 = sild25, y1 = sild75, 
         length = 0.05, angle = 90, code = 3, col = 'black', lty = 1, lwd = 0.6)
  points(ici, sild50, pch = 21, bg = 'grey', cex = 0.6, lwd = 0.4)
  
  axis(1, at = c(xlim[1], ici), 
       labels = c('', '.125', '.25', '.5', '1', '2', '4', '8', '16'), 
       cex.axis = 0.5, tck = 0.01,  mgp = c(3, -0.2, 0), lwd = 0.5, pos = ylim[1])
  axis(2, at = seq(-0.4, 0.4, by = 0.05), 
       labels = c('', '-0.35', '', '', '-0.2', '', '', '', '0', '', '', '', '0.2', '', '', '0.35', ''), 
       cex.axis = 0.5, mgp = c(3, 0.2, 0), lwd = 0.5, tck = 0.01, las = 2,
       pos = xlim[1])

}
## -----------------------------------------------------------------------------


## Function for drawing subplots of the profile figure -------------------------
profile_plot <- function(itd =  itd_lag0, ild = ild_lag0, cc = 4, mici = 6){
  
  # Arguments:
  # itd -- Octave-imported 3d array with model output for an ITD-only stimulus
  # ild -- Octave-imported 3d array with model output for an ILD-only stimulus
  # cc -- Column number of matrix, determines what output is displayed. 
  #       ild = column 2, itd = column 3 (unrestricted) or 4 (restricted, +/- 1.5 ms))
  # mici -- Matrix number: 1 = ICI of 0.125 ms, 2 = 0.25 , ..., 6 = 4, ...,  8 = 16 ms)
  
  # Set plot properties depending on if x-axis displays ilds or itds
  if (cc == 2) {
    ylim = c(-15, 15)
    lagdisp <- c(-10, -10)
  } else { 
    ylim = c(-1.5, 1.5)
    lagdisp <- c(-0.35, -0.35)
  }
  
  # Define variables to plot
  fc <- log2(0.001 * itd[, 1, mici])
  fc <- 1:length(itd[, 1, mici])
  yitd <- itd[, cc, mici]
  yild <- ild[, cc, mici]
  
  # Plot
  plot(y = rep(0, length(fc)), x = fc, pch = '', ylim = ylim, axes = FALSE, xlab = '', ylab = '')
  
  lines(y = lagdisp,  x = c(min(fc), max(fc)), lty = 1, col = 'grey', lwd = 1.5)  # Lag disparity
  lines(y = c(0, 0),  x = c(min(fc), max(fc)), lty = 1, col = 'grey', lwd = 1.5)  # Lead disparity = 0
  
  lines(y = yitd, x = fc, lty = 2, lwd = 0.7)
  lines(y = yild, x = fc, lty = 1, lwd = 0.7)
  
  
  # Add axis
  fc2 <- log2(0.001 * itd[, 1, mici])
  ylabels <- round(2^fc2, 2)
  ylabels[seq(1,length(ylabels), by = 2)] <- ''
  axis(side = 2, pos = fc[1], las = 1, tck = 0.01, cex.axis = 0.4, 
       mgp = c(3, 0.2, 0), lwd = 0.5, las = 2)
  axis(side = 1, pos = ylim[1], at = fc, labels = ylabels, las = 2, tck = 0.01,
       cex.axis = 0.3, mgp = c(3, 0.1, 0), lwd = 0.4)
}
## -----------------------------------------------------------------------------


## Functions for adding proportion correct responses to plot -------------------

# Gat data. Note library alexis109 has to be loaded:
# devtools::install_github("stamnosslin/alexis109")
getpc <- function(llr = 0) {
  d <- ths_rove  # Get data from alexis109
  d <- d[d$rove == 0, ]  # Only include no rove condition
  
  # Predictied pc
  d$pc <- 0.5 + (0.5 - d$lapsemode) * pnorm((llr - d$mmode)/d$wmode)
  
  # Organize output
  out <- d[d$bincond == 2, c(1, 12)]
  out$ild <- d[d$bincond == 1, c(12)]
  colnames(out) <- c('id', 'itd', 'ild')
  out$diff <- out$ild - out$itd
  out$id <- c('MS', 'CT', 'CS', 'EE', 'IO')  # Rename id
  out
}

addpc <- function(llr) {
  g <- getpc(llr)  # Get data
  g[, 2:4] <- round(100 * g[ , 2:4])  # Convert to percent
  g[] <- lapply(g, as.character)  # Convert to characters
  g[g == "100"] <- ">99"
  
  
  # This code adds spaces if needed to make 3 chs
  indx <- expand.grid(cc = 2:4, rr = 1:nrow(g))
  
  for (j in 1:nrow(indx)) {
    tt <- g[indx$rr[j], indx$cc[j]] 
    
    if(nchar(tt) == 1) {
      tt <- paste('  ', tt, sep = '')
    } else if (nchar(tt) == 2) {
      tt <- paste(' ', tt, sep = '')
    }
    
    g[indx$rr[j], indx$cc[j]] <- tt
  }

    
  par(family = "mono")  # Monospaced font
  k <- -0.1  # Constant that adjust vertical position of table
  
  # Headings
  text(x = 19.2, y = 1.40 + k, labels = 'Percent correct', pos = 4, cex = 0.45, font = 1)
  text(x = 17, y = 1.28 + k, labels = 'ID ITD-only ILD-only diff.', pos = 4, cex = 0.4, font = 1)
  lines(c(17, 32), c(1.20 + k, 1.20 + k), lwd = 0.2)
  
  # Data
  iddata <- function(grow) {
    out <- paste(g[grow, 1], ' ', g[grow, 2], '   ', g[grow, 3], '  ', g[grow, 4])
    out
  }
  
  cex <- 0.4  # Font size in rows
  text(x = 17, y = 1.1 + k, labels = iddata(1), pos = 4, cex = cex, font = 1)
  text(x = 17, y = 1.0 + k, labels = iddata(2), pos = 4, cex = cex, font = 1)
  text(x = 17, y = 0.9 + k, labels = iddata(3), pos = 4, cex = cex, font = 1)
  text(x = 17, y = 0.8 + k, labels = iddata(4), pos = 4, cex = cex, font = 1)
  text(x = 17, y = 0.7 + k, labels = iddata(5), pos = 4, cex = cex, font = 1)
  
  par(family = "")  # Set font to default
}
