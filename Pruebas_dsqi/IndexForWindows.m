
%calculate the index for windows of 4 seconds
function [kSQI,sSQI, pSQI, cSQI, basSQI] = IndexForWindows(ECG)
      ecg = importdata(ECG);
      ecg_values = ecg.data;
      data = ecg_values(:,3);
      
      FS_original = 1000;
      Fs_new = 330;
      [P,Q] = rat(Fs_new/FS_original);
      data_s = resample(data,P,Q);
      %plot(data_s);

      len = length(data_s);
      window_len = 4*Fs_new;
      size_vector = round(len/window_len);
      kurtosis_vector =zeros(1,size_vector);

      for i=0:((len/window_len)-1)
         data_f=data_s(i*(window_len)+1:(i+1)*(window_len)+1);
         [kSQI,sSQI, pSQI, cSQI] = IndexCalculation(data_f);
         kurtosis_vector(i*(window_len)+1:(i+1)*(window_len)+1) = kSQI;
      end
          plot(data_s);
          plot(kurtosis_vector);

end