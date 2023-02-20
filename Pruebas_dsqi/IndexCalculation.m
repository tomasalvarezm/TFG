
%calcular kurtosis(KSQI), skewness(sSQI), potencia en QRS(pSQI),
%variabilidad entre intervalos R-R(cSQI) y potencia en baseline(basSQI)
function [kSQI,sSQI, pSQI, cSQI, basSQI] = IndexCalculation(data_s)

      kSQI = kurtosis(data_s); %kurtosis
      sSQI = skewness(data_s); %skewness
      pSQI = relativePower(data_s); %relative power in QRS
      cSQI = variability_RR(data_s); %variability in the R-R interval
      basSQI = baseline_drift(data_s); %relative power in the baseline
end 

function[rel_power] = relativePower(data)
     freqrange1 = [5,15];
     freqrange2 = [5,50];
     p1 = bandpower(data,330,freqrange1);
     p2 =  bandpower(data,330,freqrange2);
     rel_power = p1/p2;

end

function[var_RR] = variability_RR(data)
    [qrs,varargout] = pantompkins_qrs(data,330,logical(0));
    len = length(qrs);
    vector_RR= qrs(2:len)-qrs(1:(len-1));
    var_RR = std(vector_RR)/mean(vector_RR);
end


function[bas_power] = baseline_drift(data)
    freq1= [0,1];
    freq2 = [0,40];
    p1 = bandpower(data,330,freq1);
    p2 = bandpower(data,330,freq2);
    bas_power = (1-p1)/p2;
end 
