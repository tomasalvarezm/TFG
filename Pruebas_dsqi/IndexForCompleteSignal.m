%calculate index for the complete signal 

function [kSQI_01,sSQI_01, pSQI_01, cSQI_01, basSQI_01,dSQI_01,geometricMean] = IndexForCompleteSignal(ECG)
      ecg = importdata(ECG);
      ecg_values = ecg.data;
      data = ecg_values(:,3);
      
      FS_original = originalFS;
      Fs_new = samplingFreq;
      [P,Q] = rat(Fs_new/FS_original);
      data_s = resample(data,P,Q);
      [qrs,varargout] = pantompkins_qrs(data_s,samplingFreq,logical(0));
      %plot(data_s);

      [kSQI,sSQI, pSQI, cSQI,basSQI] = IndexCalculation(data_s,qrs); %index calculation
      [total_dSQI, cont_dSQI, s_dSQI] = dsqi(data_s, samplingFreq); %calculate dSQI
      [kSQI_01,sSQI_01, pSQI_01, cSQI_01, basSQI_01,dSQI_01,geometricMean] = AssignValueToIndexes(kSQI,sSQI,pSQI,cSQI,basSQI,total_dSQI); %translate index value to a value between 0.1 and 1
      
end