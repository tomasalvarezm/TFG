
function [ECGmv_Bitalino] = ImportBitalinoData(fileName)
  ecg = importdata(fileName);
  ecg_values = ecg.data;
  data = ecg_values(:,3);

  %transform data to mv
  data_v = (((data/2^16)-1/2)*3)/1019;
  ECGmv_Bitalino= data_v*1000;

end 