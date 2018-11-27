function d = cc(ici_cond = 2, llr_db = 0, ild_db = 0, itd_ms = 0.35, lagonly = 1,
                ihc = 0)
# Calculates ILDs and ITDs on output of gamma tone filterbank, separately for each 
# center frequency (fix function code, vatbale fc, to specify frequency range). 
# Type of stimuli are decided by parameters:
#   ici_cond -- Inter-click intervals (ms), could be a vector of several ICIs
#   llr_db -- Lag-lead ratio in dB
#   ild_db -- ILD of lag click in dB
#   itd_ms -- ITD of lag click in ms
#   lagonly -- Set to 1 if only lag part of signal should be analyzed, else the
#            whole signal (lead followed by lag) will be analyzed
#   ihc -- Using ihcenvelope() for half-wave rectifying and low pass filtering

for jj = 1:length(ici_cond)

  ## Create strimulus ----------------------------------------------------------
  fs = 48000;                    
  maxgain = 0.9;

  itd = round((itd_ms/1000) * fs); %itd samples
  ici_ms = ici_cond(jj);
  ici = round((ici_ms/1000) * fs); %ici samples

  t = 1/fs:1/fs:0.1;
  llr_gain = 10 ^ (llr_db/20);
  ild_gain = 10 ^ (ild_db/20);

  left = zeros(4800, 1);
  left(481:486) = maxgain * ones(6, 1);
  left(481+ici:486+ici) = maxgain * llr_gain * ones(6, 1);


  right = zeros(4800, 1);
  right(481:486) = maxgain * ones(6, 1);
  right((481+ici:486+ici) - itd) = maxgain * llr_gain * ild_gain * ones(6, 1);
  
  # Low pass butterworth
  order = 6;
  fc = 22000;  # Cutoff frequency
  [b,a] = butter(order, fc/(fs/2));
  left = filter(b, a, left);
  right = filter(b, a, right);
  ## ---------------------------------------------------------------------------
 
 
  ## Frequncy range of auditory filters -----------------------------------------
  flow = 100.0;                  
  fhigh = 8000.0 ;     
  ## ---------------------------------------------------------------------------
  
  ## Gamma tone filtering and haf-wave rectifyng ------------------------------- 
  fc = erbspacebw(flow, fhigh, bw = 1, hitme = 100)';  % 1-erb spaced center frequencis
  
  # See http://amtoolbox.sourceforge.net/amt-0.9.9/doc/general/gammatone.php
  # for recommended setting with 'complex'
  # [b a] = gammatone(fc,fs,'classic','causalphase','real');  % Filter coeff
  [b,a] = gammatone(fc,fs,'complex'); % Filter coeff 
  
  left_out = 2*real(ufilterbankz(b,a,left));  % Output left channel
  right_out = 2*real(ufilterbankz(b,a,right)); % Output right channel  
  
  # Half-wave rectify to simulate basilar membrane and haircell non-linearity
  if (ihc == 1)  # Using ihcenvelope()
    left_out = ihcenvelope(left_out, fs, 'ihc_lindemann'); # 'ihc_dau' 'ihc_breebaart' 'ihc_lindemann'
    right_out = ihcenvelope(right_out, fs, 'ihc_lindemann'); 

  else  # Using simple "manual" half-wave rectifying    
    left_out = left_out .* (left_out > 0);
    right_out = right_out .* (right_out > 0);
  endif 
  ## ---------------------------------------------------------------------------
  
  
      
  ## Calculate ILDs [dB] and ITDs [ms] -----------------------------------------
  s1 = 1; #481; # Start sample of analysis window (if lagonly == 0, else it starts at s1 + ici)
  s2 = 4000; #2400;  # End sample of analysis window (if lagonly == 0, else it ends at s2 + ici)
  
  # Empty vectors
  ilds = zeros(length(fc), 1);
  itds_p = zeros(length(fc), 1);
  itds_p2 = zeros(length(fc), 1);
  itds_c = zeros(length(fc), 1);
  
  if (lagonly == 1)
    icix = ici;  % only analyze signal from start of lag click
  else
    icix = 0;  % Analyze both lead and lag
  endif
  
  for j = 1:length(fc)
    % ILDs
    ms_left = sum(left_out(s1+icix:s2+icix, j).^2);
    ms_right = sum(right_out(s1+icix:s2+icix, j).^2);
    ilds(j) = 10 * log10(ms_right/ms_left);
    
  # ITDs as peak of cross-corr function (unrestricted)
  [R, lag] = xcorr(left_out(s1+icix:s2+icix, j), right_out(s1+icix:s2+icix, j), scale = 'coeff');
  lplace = find(R == max(R));  % Find peak (if lead included: watch out for discributions with double peaks, at longer ICIs)
  lagsample = lag(lplace);  % Find samples corresponding to peak
  lagms = lagsample/48;  % Convert samples ti ms
  itds_p(j) = lagms(1);  % Select first (lowest) if more than one
  
  # ITDs as peak of cross-corr function (restricted +/- 1.5 ms)
  lo = find(lag == -(1.5 * fs)/1000);  # - n  samples, corresponding to -1.5 ms
  hi = find(lag == (1.5 * fs)/1000);   # + n samples, corresponding to 1.5 ms
  lplace2 = find(R == max(R(lo:hi)));  % Find peak (if lead included: watch out for discributions with double peaks, at longer ICIs)
  lagsample2 = lag(lplace2);  % Find samples corresponding to peak
  lagms2 = lagsample2/48;  % Convert samples to ms
  itds_p2(j) = lagms2(1);  % Select first (lowest) if more than one
  
  # ITDs as Center of Gravity of cross-corr function (unrestricted)
  itds_c(j) = COG(R, lag, 1)/48;  # Centroid in ms
  endfor
  ## ---------------------------------------------------------------------------
  
  ## Package output ------------------------------------------------------------
  out(:,:,jj) = [fc, ilds, itds_p, itds_p2, itds_c];
  d = out;
  ## Package output ------------------------------------------------------------
endfor

endfunction
