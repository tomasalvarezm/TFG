%calculate index for the complete signal 

function [kSQI,sSQI, pSQI, cSQI, basSQI] = SignalIndexes(ECG)
      ecg = importdata(ECG);
      ecg_values = ecg.data;
      data = ecg_values(:,3);
      
      FS_original = 1000;
      Fs_new = samplingFreq;
      [P,Q] = rat(Fs_new/FS_original);
      data_s = resample(data,P,Q);
      [qrs,varargout] = pantompkins_qrs(data_s,330,logical(0));
      plot(data_s);

      [kSQI,sSQI, pSQI, cSQI,basSQI] = IndexCalculation(data_s,qrs);
      

      
end