
function [ECGmv] = ImportDataMultipleChannels(fileName,channel)
ecg = importdata(fileName);
%ecg_values = ecg.data; -> si el archivo tiene cabecera también hay que
%hacer esto
data = ecg(:,channel);
data_v = (((data/2^16)-1/2)*3)/1019;
ECGmv= data_v*1000;
end 