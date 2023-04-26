


% %for complete signal
% [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean,averageIndex] = IndexForCompleteSignal("1180858_unacceptable.txt");
% 
% 
% %for windows of 10s
% 
ecg = importdata("ECG-25-04-8H.txt");
%ecg_values = ecg.data;
channel_number = 3; %3 para top, 4 camiseta, 5 pantalón
data = ecg(:,channel_number);
data_v = (((data/2^16)-1/2)*3)/1019;
data_mv= data_v*1000;
[kSQI_01_vector,sSQI_01_vector, pSQI_01_vector, rel_powerLine01_vector,cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data_mv,originalFSBitalino);

