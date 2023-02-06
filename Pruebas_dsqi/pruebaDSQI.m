function [total_score, cont_score, sub_ind] = pruebaDSQI(ECG)
      ecg = importdata(ECG)
      ecg_values = ecg.data
      data = ecg_values(:,3)
      plot(data)
      data_s = downsample(data,3)

      [total_score,cont_score,sub_ind] = dsqi(data_s,333)
end 

