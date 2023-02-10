
%calcular kurtosis(KSQI), skewness(sSQI), potencia en QRS(pSQI),
%variabilidad entre intervalos R-R(cSQI) y potencia en baseline(basSQI)
function [kSQI,sSQI, pSQI, cSQI, basSQI] = IndexCalculation(data_s)

      kSQI = kurtosis(data_s); %kurtosis
      sSQI = skewness(data_s); %skewness
      pSQI = relativePower(data_s); %relative power in QRS
      cSQI = variability_RR(data_s); %variability in the R-R interval
      %basSQI = baseline_drift(data_s); %relative power in the baseline
end 

function[rel_power] = relativePower(data)
     ecg_ft = fft(data);
     ecg_power = (abs(ecg_ft)); %no se como calcular la potencia dentro de un
    % rango de frecuencias. Con un for?
    x = zeros(1,10);
    y = zeros(1,45);
    for i=5:15
        x(i) = ecg_power(i);
    end
    for j=5:50
        y(j) = ecg_power(j);
    end
     p1 = sum(x);
     p2 =  sum(y);
     rel_power = p1/p2;

end

function[var_RR] = variability_RR(data)
    [qrs,varargout] = pantompkins_qrs(data,330,logical(0));
    len = length(qrs);
    %vector_RR = zeros(1,len);
    vector_RR= qrs(2:len)-qrs(1:(len-1));
    var_RR = std(vector_RR)/mean(vector_RR);
end

%{
function[bas_power] = baseline_drift(data)
    ecg_ft = fft(data)
    p1 = 
    p2 = 
    bas_power = (1-p1)/p2;
end 
%}