
%calcular kurtosis(KSQI), skewness(sSQI), potencia en QRS(pSQI),
%variabilidad entre intervalos R-R(cSQI) y potencia en baseline(basSQI)
function [kSQI,sSQI, pSQI, cSQI, basSQI] = IndexCalculation(data_s,qrs_vector)

      kSQI = kurtosis(data_s); %kurtosis
      sSQI = skewness(data_s); %skewness
      pSQI = relativePower(data_s); %relative power in QRS
      cSQI = variability_RR(qrs_vector); %variability in the R-R interval
      basSQI = baseline_drift(data_s); %relative power in the baseline
end 

function[rel_power] = relativePower(data)
     freqrange1 = [5,15];
     freqrange2 = [5,40];
     data_v = (((data/2^16)-1/2)*3)/1019;
     data_mv = data_v*1000;
     p1 = bandpower(data_mv,330,freqrange1);
     p2 =  bandpower(data_mv,330,freqrange2);
     rel_power = p1/p2;

end

function[var_RR] = variability_RR(qrs_vector)
    len = length(qrs_vector);
    vector_RR= qrs_vector(2:len)-qrs_vector(1:(len-1));
    vector_RR_seconds = vector_RR/samplingFreq;
    vector_RR_ms = vector_RR_seconds*1000;
  
    %var_RR = std(vector_RR_seconds)/mean(vector_RR);
    var_RR = std(vector_RR_ms)/mean(vector_RR);
end


function[bas_power] = baseline_drift(data)
    freq1= [0,1];
    freq2 = [0,40];
    data_v1 = (((data/2^16)-1/2)*3)/1019;
    data_mv1 = data_v1*1000;
    p1 = bandpower(data_mv1,330,freq1);
    p2 = bandpower(data_mv1,330,freq2);
    
    %p1 = p1*p1/(samplingFreq*length(data));
    %p2 = p2*p2/(samplingFreq*length(data));
    bas_power = 1-(p1/p2);
end 
