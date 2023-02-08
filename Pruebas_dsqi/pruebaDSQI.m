function [total_score, cont_score, sub_ind] = pruebaDSQI(ECG)
      ecg = importdata(ECG);
      ecg_values = ecg.data;
      data = ecg_values(:,3);
      
      FS_original = 1000;
      Fs_new = 330;
      [P,Q] = rat(Fs_new/FS_original);
      data_s = resample(data,P,Q);
      plot(data_s);

      [total_score,cont_score,sub_ind] = dsqi(data_s,333);
end 
