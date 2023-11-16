%Imports data recroded by Bitalino/Plux without a header present
%
%It receives as arguments the name of the file to be imported (fileName)
% and the channel number (channel)

function [ECGmv] = ImportPluxDataWithHeader(fileName, channel)
ecg = importdata(fileName);
%ecg_values = ecg.data; -> si el archivo tiene cabecera también hay que
%hacer esto
data = ecg(:,channel);

%transform data to mv
%https://support.pluxbiosignals.com/knowledge-base/transfer-functions-converting-digital-sensor-data-into-physical-units/
data_v = (((data/2^16)-1/2)*3)/1019;
ECGmv= data_v*1000;
end 