#' Data from experiment ALEXIS 109: Lateralization experiment
#'
#' This is data from an experiment with three participants, tested on lateralization
#' of a large binaural difference in lag clicks following a lead click after
#' an inter-click interval between 0.125 to 256 ms. The binaural difference was
#' an ITD of 0.35 ms or an ILD of 10 dB or both.
#'
#' @format A data frame with 49,140 rows and 13 columns.
#' \describe{
#'   \item{id}{Participant unique id number}
#'   \item{date}{Date of testing}
#'   \item{time}{Time of day for each trial}
#'   \item{day}{Rank order of date the data was collected}
#'   \item{session}{Session number, there were 13 sessions, run on the same day}
#'   \item{trial}{Trial number within session, from 1 to 60}
#'   \item{ici}{Inter-click interval in ms, Note: -1 is for sessions with no lead click}
#'   \item{ild}{Inter-arual-level difference of variable, 0 or 10 dB}
#'   \item{itd}{Inter-arual-time difference of variable, 0 or 0.35 ms}
#'   \item{ratio}{dB-difference between lead and lag click of variable}
#'   \item{revno}{Reversal number, equals 0 if the trial was not a reversal}
#'   \item{correct}{Binaural cue pointing left (1) or right (0)}
#'   \item{answer}{The answer given by the listener, "left" (1) or "right" (0).
#'                 The answer was correct if answer == correct}
#'   }
"data109lat"


#' Data from experiment ALEXIS 109: Detection experiment
#'
#' This is data from an experiment with three participants, tested on detection
#' of a lag click following a lead click after an inter-click interval between
#' 0.125 to 256 ms. The binaural difference in the lag-click was an ITD of 0.35 ms
#' an ILD of 10 dB or both or neither.
#'
#' @format A data frame with 60,480 rows and 13 columns.
#' \describe{
#'   \item{id}{Participant unique id number}
#'   \item{date}{Date of testing}
#'   \item{time}{Time of day for each trial}
#'   \item{day}{Rank order of date the data was collected}
#'   \item{session}{Session number, there were 13 sessions, run on the same day}
#'   \item{trial}{Trial number within session, from 1 to 60}
#'   \item{ici}{Inter-click interval in ms, Note: -1 is for sessions with no lead click}
#'   \item{ild}{Inter-arual-level difference of variable, 0 or 10 dB}
#'   \item{itd}{Inter-arual-time difference of variable, 0 or 0.35 ms}
#'   \item{ratio}{dB-difference between lead and lag click of variable}
#'   \item{revno}{Reversal number, equals 0 if the trial was not a reversal}
#'   \item{correct}{Lag click present (1) or absent (0)}
#'   \item{answer}{The answer given by the listener, "left" (1) or "right" (0).
#'                 The answer was correct if answer == correct}
#'   }
"data109det"


#' Data from experiment ALEXIS 109: Extra experiment with level roving
#'
#' This is data from an experiment with five participants, tested on tested on
#' lateralization of a large binaural difference in lag clicks following a lead click
#' after an inter-click interval of 4 ms. The binaural difference was
#' an ITD of 0.35 ms or an ILD of 10 dB or both. The overall level of the first
#' and second interval was randomly and independently roved +/- 10 dB in the roving
#' condition
#'
#' @format A data frame with 9,600 rows and 16 columns.
#' \describe{
#'   \item{id}{Participant unique id number}
#'   \item{date}{Date of testing}
#'   \item{time}{Time of day for each trial}
#'   \item{day}{Rank order of date the data was collected}
#'   \item{session}{Session number, there were 13 sessions, run on the same day}
#'   \item{trial}{Trial number within session, from 1 to 60}
#'   \item{ici}{Inter-click interval in ms, Note: -1 is for sessions with no lead click}
#'   \item{ild}{Inter-arual-level difference of variable, 0 or 10 dB}
#'   \item{itd}{Inter-arual-time difference of variable, 0 or 0.35 ms}
#'   \item{ratio}{dB-difference between lead and lag click of variable}
#'   \item{revno}{Reversal number, equals 0 if the trial was not a reversal}
#'   \item{rove}{Overall levels not toved (0) or roved (1)}
#'   \item{srove}{Amount of rove of standard stimulus in this trial, dB}
#'   \item{vrove}{Amount of rove of variable stimulus in this trial, dB}
#'   \item{correct}{Binaural cue pointing left (1) or right (0)}
#'   \item{answer}{The answer given by the listener, "left" (1) or "right" (0).
#'                 The answer was correct if answer == correct}
#'   }
"data109rov"

#' Processed data from experiment ALEXIS 109: Lateralization experiment
#'
#' This is processed data (estimated thresholds) from an experiment with three participants, tested on lateralization
#' of a large binaural difference in lag clicks following a lead click after
#' an inter-click interval between 0.125 to 256 ms. The binaural difference was
#' an ITD of 0.35 ms or an ILD of 10 dB or both.
#'
#' @format A data frame with 117 rows and 11 columns.
#' \describe{
#'   \item{id}{Participant unique id number}
#'   \item{ici}{Inter-click interval in ms, Note: -1 is for sessions with no lead click}
#'   \item{bincond}{Binaural condition: 1 = ILD-only, 2 = ITD-only, 3 = ITD+ILD}
#'   \item{thmode}{Threshold estimate (mode of posterior distribution), i.e., LLR [dB] at 75 percent correct responses}
#'   \item{X.0.95}{Lower 0.95 credibility interval of posterior distribution of threshold}
#'   \item{X0.95.}{Upper 0.95 credibility interval of posterior distribution of threshold}
#'   \item{mmode}{Mode of location parameter m}
#'   \item{wmode}{Mode of scale parameter w (spread)}
#'   \item{lapsemode}{Mode of lapse-reate parameter lambda}
#'   \item{mineff}{MCMC diagnostic: lowest (worst) effective sample size over estimated parameters}
#'   \item{maxrhat}{MCMC diagnostic: highest (worst) rhat (should be very close to 1.00)}
#'   }
"ths_lat"

#' Processed data from experiment ALEXIS 109: Detection experiment
#'
#' This is processed data (estimated thresholds) from an experiment with three participants, tested on detection
#' of a lag click following a lead click after
#' an inter-click interval between 0.125 to 256 ms. The binaural difference of the lag click was
#' an ITD of 0.35 ms or an ILD of 10 dB or both or none.
#'
#' @format A data frame with 144 rows and 11 columns.
#' \describe{
#'   \item{id}{Participant unique id number}
#'   \item{ici}{Inter-click interval in ms, Note: -1 is for sessions with no lead click}
#'   \item{bincond}{Binaural condition: 0 = Center, no ITD and no ILD, 1 = ILD-only, 2 = ITD-only, 3 = ITD+ILD}
#'   \item{thmode}{Threshold estimate (mode of posterior distribution), i.e., LLR [dB] at 75 percent correct responses}
#'   \item{X.0.95}{Lower 0.95 credibility interval of posterior distribution of threshold}
#'   \item{X0.95.}{Upper 0.95 credibility interval of posterior distribution of threshold}
#'   \item{mmode}{Mode of location parameter m}
#'   \item{wmode}{Mode of scale parameter w (spread)}
#'   \item{lapsemode}{Mode of lapse-reate parameter lambda}
#'   \item{mineff}{MCMC diagnostic: lowest (worst) effective sample size over estimated parameters}
#'   \item{maxrhat}{MCMC diagnostic: highest (worst) rhat (should be very close to 1.00)}
#'   }
"ths_det"

#' Processed data from experiment ALEXIS 109: Additional experiment with roving
#'
#' This is processed data (estimated thresholds) from an experiment with five participants, tested on laterlization
#' of a lag click following a lead click after
#' 4 ms. The binaural difference of the lag click was either
#' an ITD of 0.35 ms or an ILD of 10 dB. The level of the signals in each interval of teh task was either constant or 
#' randomly roved +/-10 dB.
#'
#' @format A data frame with 20 rows and 11 columns.
#' \describe{
#'   \item{id}{Participant unique id number}
#'   \item{ici}{Inter-click interval in ms, Note: -1 is for sessions with no lead click}
#'   \item{bincond}{Binaural condition: 0 = Center, no ITD and no ILD, 1 = ILD-only, 2 = ITD-only, 3 = ITD+ILD}
#'   \item{thmode}{Threshold estimate (mode of posterior distribution), i.e., LLR [dB] at 75 percent correct responses}
#'   \item{X.0.95}{Lower 0.95 credibility interval of posterior distribution of threshold}
#'   \item{X0.95.}{Upper 0.95 credibility interval of posterior distribution of threshold}
#'   \item{mmode}{Mode of location parameter m}
#'   \item{wmode}{Mode of scale parameter w (spread)}
#'   \item{lapsemode}{Mode of lapse-reate parameter lambda}
#'   \item{mineff}{MCMC diagnostic: lowest (worst) effective sample size over estimated parameters}
#'   \item{maxrhat}{MCMC diagnostic: highest (worst) rhat (should be very close to 1.00)}
#'   }
"ths_rove"
