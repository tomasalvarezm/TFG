%calculate index for the complete signal 

function [kSQI,sSQI, pSQI, cSQI, basSQI] = IndexForCompleteSignal(ECG)
      ecg = importdata(ECG);
      ecg_values = ecg.data;
      data = ecg_values(:,3);
      
      FS_original = 1000;
      Fs_new = samplingFreq;
      [P,Q] = rat(Fs_new/FS_original);
      data_s = resample(data,P,Q);
      [qrs,varargout] = pantompkins_qrs(data_s,samplingFreq,logical(0));
      plot(data_s);

      [kSQI,sSQI, pSQI, cSQI,basSQI] = IndexCalculation(data_s,qrs);
      [total_dSQI, cont_dSQI, s_dSQI] = dsqi(data_s, samplingFreq);
      [kSQI_index01,sSQI_index01, pSQI_index01, cSQI_index01, basSQI_index01, gmean ] = AssignValueToIndexes(kSQI,sSQI,pSQI,cSQI,basSQI);
%       disp(kSQI_index01);
%       disp(sSQI_index01);
%       disp(pSQI_index01);
%       disp(cSQI_index01);
%       disp(basSQI_index01);
%       disp(gmean);
      
      

      
end