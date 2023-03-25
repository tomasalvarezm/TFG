%calculate index for the complete signal 

function [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean] = IndexForCompleteSignal(data, FS_original)
     
      Fs_new = samplingFreq;
      [P,Q] = rat(Fs_new/FS_original);
      data_s = resample(data,P,Q);
      [qrs,varargout] = pantompkins_qrs(data_s,samplingFreq,logical(0));
      qrs_seconds = qrs/samplingFreq;
      if(showPlots)
          plot(data_s);
      end

      if (length(qrs) <= 1)
        noRR = 1;
      else
        noRR = 0;
      end
      
      [kSQI,sSQI, pSQI, rel_powerLine,cSQI,basSQI] = IndexCalculation(data_s,qrs_seconds, noRR); %index calculation
      [total_dSQI, cont_dSQI, s_dSQI] = dsqi(data_s, samplingFreq); %calculate dSQI
      [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean] = AssignValueToIndexes(kSQI,sSQI,pSQI, rel_powerLine,cSQI,basSQI,total_dSQI); %translate index value to a value between 0.1 and 1
      indexes = [kSQI_01,sSQI_01,pSQI_01,SQI_rel_powerLine_01,cSQI_01,basSQI_01,dSQI_01];
      
    
      
end