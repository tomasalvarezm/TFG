function [total_score, cont_score, sub_ind] = pruebaDSQI(ECG)
      ecg = importdata(ECG);
      ecg_values = ecg.data;
      data = ecg_values(:,3);
      
      FS_original = originalFS;
      Fs_new = samplingFreq;
      [P,Q] = rat(Fs_new/FS_original);
      data_s = resample(data,P,Q);
      plot(data_s);

      [total_score,cont_score,sub_ind] = dsqi(data_s,samplingFreq);
end 
