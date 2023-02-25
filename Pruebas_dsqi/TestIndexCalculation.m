
%[kurtosis_vector,skewness_vector, power_vector, var_vector, bas_vector] = IndexForSignalWindows("Tela1_Escaleras.txt");



[kSQI,sSQI, pSQI, cSQI,basSQI] = IndexForCompleteSignal("ECGNormal.txt");

%Interpolation of values
% x = [0.25 5];
% y = [0.1 1];
% vq = 0.7;
% 
% k = interp1(x,y,vq);

