
%calculate the index for windows of 4 seconds
function [kurtosis_vector,skewness_vector, power_vector, var_vector, bas_vector] = IndexForSignalWindows(ECG)
      ecg = importdata(ECG);
      ecg_values = ecg.data;
      data = ecg_values(:,3);
      
      FS_original = 1000;
      Fs_new = samplingFreq;
      [P,Q] = rat(Fs_new/FS_original);
      data_s = resample(data,P,Q);
      %plot(data_s);

      len = length(data_s);
      window_len = windowSize*Fs_new;
      size_vector = round((len/window_len));
      kurtosis_vector =zeros(1,size_vector);
      skewness_vector = zeros(1,size_vector);
      power_vector = zeros(1,size_vector);
      var_vector = zeros(1,size_vector);
      bas_vector = zeros(1,size_vector);
      [qrs,varargout] = pantompkins_qrs(data_s,samplingFreq,logical(0)); 

      for i=1:(((round(len/window_len))-1))
          
         data_f=data_s((i-1)*(window_len)+1:i*(window_len)+1);
         qrs_window = qrs(i:i+windowSize); 
         [kSQI,sSQI, pSQI, cSQI,basSQI] = IndexCalculation(data_f,qrs_window);
         kurtosis_vector(i) = kSQI; 
         kurtosis_vector_ups = upsampleVector(kurtosis_vector);
         skewness_vector(i) = sSQI;
         skewness_vector_ups = upsampleVector(skewness_vector);
         power_vector(i) = pSQI;
         power_vector_ups = upsampleVector(power_vector);
         var_vector(i) = cSQI;
         var_vector_ups = upsampleVector(var_vector);
         bas_vector(i) = basSQI;
         bas_vector_ups = upsampleVector(bas_vector);
      end
          showAllPlots = showPlots;
          if(showAllPlots == 1)
          plot(data_s);
          hold on;
          plot(kurtosis_vector_ups*(50000/mean(kurtosis_vector))); %upsampling del vector y multiplicar 
          title("ECG+Kurtosis");

          figure
          plot(data_s);
          hold on;
          plot(skewness_vector_ups*(50000/mean(skewness_vector)));
          title("ECG+Skewness");

          figure
          plot(data_s);
          hold on;
          plot(power_vector_ups*(50000/mean(power_vector)))
          title("ECG+Power");

          figure
          plot(data_s);
          hold on;
          plot(var_vector_ups*(50000/mean(var_vector)));
          title("ECG+R-RVariability");

          figure
          plot(data_s);
          hold on;
          plot(bas_vector_ups*(50000/mean(bas_vector)));
          title("ECG+BaseLine");
          end

end

function [vector_ups] = upsampleVector(vector)
    Fs = 1/windowSize;
    Fs_ecg = samplingFreq;
    [P1,Q1] = rat(Fs_ecg/Fs);
    vector_ups = resample(vector,P1,Q1);

end