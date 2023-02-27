
function [total_score, cont_score, sub_ind] = pruebaDSQI2(ECG)
      ecg = importdata(ECG);
      ecg_values = ecg.data;
      data = ecg_values(:,3);
      
      FS_original = originalFS;
      Fs_new = samplingFreq;
      [P,Q] = rat(Fs_new/FS_original);
      data_s = resample(data,P,Q);

      len = length(data_s);
      len_10 = round(len/10)-1;
      d =zeros(1,len);
for i = 0:9
    data_f=data_s(i*(len_10)+1:(i+1)*(len_10)+1);
    [total_score,cont_score,sub_ind] = dsqi(data_f,samplingFreq);
    fprintf('%i %f %f %f \n', i,  mean(mean(mean((sub_ind)))),  nanmean(cont_score), total_score);
    d(i*(len_10)+1:(i+1)*(len_10)+1)=cont_score;  

end
          plot(data_s);
          plot(d*70000);

end 