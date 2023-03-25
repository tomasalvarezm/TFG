
%calcular kurtosis(KSQI), skewness(sSQI), potencia en QRS(pSQI),
%variabilidad entre intervalos R-R(cSQI) y potencia en baseline(basSQI)
function [kSQI,sSQI, pSQI, rel_powerLine, cSQI, basSQI] = IndexCalculation(data_s,qrs_vector, noRR)

      kSQI = kurtosis(data_s); %kurtosis
      sSQI = skewness(data_s); %skewness
      pSQI = relativePower(data_s); %relative power in QRS
      rel_powerLine = relPowerlinePower(data_s);
      cSQI = variability_RR(qrs_vector, noRR); %variability in the R-R interval
      basSQI = baseline_drift(data_s); %relative power in the baseline
end 

function[rel_power] = relativePower(data)
     freqrange1 = [5,15];
     freqrange2 = [5,samplingFreq/2-1];
     p1 = bandpower(data,samplingFreq,freqrange1);
     p2 =  bandpower(data,samplingFreq,freqrange2);
     rel_power = p1/p2;
end

function[rel_powerLine] = relPowerlinePower(data)
     freqrange1 = [45, 60];
     freqrange2 = [5,15];
     p1 = bandpower(data,samplingFreq,freqrange1);
     p2 =  bandpower(data,samplingFreq,freqrange2);
     rel_powerLine = p1/p2;
     %00,016 bueno

end

function[var_RR] = variability_RR(qrs_vector, noRR)
    if(noRR)
        var_RR = 1000; %coul not compute; will force minimum value on value assignment in AssignValueToIndexes
        return
    end
    
    if (length(qrs_vector) <5 ) %if less than 5 beats in 10 seconds
        var_RR =1; % = score of 0 for the index        
    else
        len = length(qrs_vector);
        vector_RR= qrs_vector(2:len)-qrs_vector(1:(len-1)); %esto ya está en segundos y no en muestras
        %vector_RR_seconds = vector_RR/samplingFreq;
        vector_RR_ms = vector_RR*1;
        var_RR = std(vector_RR_ms)/mean(vector_RR_ms);
    end
end


function[bas_power] = baseline_drift(data)
    freq1= [0,2];
    freq2 = [0,40];
    p1 = bandpower(data,samplingFreq,freq1);
    p2 = bandpower(data,samplingFreq,freq2);
    
    %p1 = p1*p1/(samplingFreq*length(data));
    %p2 = p2*p2/(samplingFreq*length(data));
    bas_power = 1-(p1/p2);
end 
