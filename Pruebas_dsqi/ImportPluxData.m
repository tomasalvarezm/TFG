%Imports data recroded by Plux devices witht a header present
%
%It receives as arguments the name of the file to be imported (fileName)
% and the channel number to import (channel)

function [ECGmv_Bitalino] = ImportPluxData(fileName, channel)
  ecg = importdata(fileName);
  ecg_values = ecg.data;
  data = ecg_values(:, channel);

  %transform data to mv
  %https://support.pluxbiosignals.com/knowledge-base/transfer-functions-converting-digital-sensor-data-into-physical-units/
  data_v = (((data/2^16)-1/2)*3)/1019;
  ECGmv_Bitalino= data_v*1000;

end 