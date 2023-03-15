
function [ECGmv_Physionet] = ImportPhysionetData(ECG)
      ecg = importdata(ECG);
      leadNumber = 2;
      data = ecg(:,leadNumber);

      %transform to mv
      ECGmv_Physionet = data/200;

end