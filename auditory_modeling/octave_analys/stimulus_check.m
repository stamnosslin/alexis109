function g = stimulus_check(ici_cond = 4, llr_db = 0, ild_db = 0, itd_ms = -0.35)
# This function is just a check to see that the main function, cc(), calculate
# parameters on the correct stimulus. Input arguments and code is the same as
# in cc() under #Create stimulus" (please check that the code are equivalent   
  
  ## Create strimulus ----------------------------------------------------------
  fs = 48000;                    
  maxgain = 0.9;

  itd = round((itd_ms/1000) * fs); %itd samples
  ici_ms = ici_cond;
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
  left_lpass = filter(b, a, left);
  right_lpass = filter(b, a, right);
  ## ---------------------------------------------------------------------------
  
  ## Plot without low pass
  figure(1)
  plot(t, left + 1.2, '-ob', 'markersize', 2, t, right, '-or', 'markersize', 2)
  
  ## Plot with low pass
  figure(2)
  plot(t, left_lpass + 1.2, '-ob', 'markersize', 2, t, right_lpass, '-or', 'markersize', 2)
  
endfunction