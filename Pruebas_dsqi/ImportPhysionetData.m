
function [ECGmv_Physionet] = ImportPhysionetData(fileName, leadNumber)
      ecg = importdata(fileName);
      data = ecg(:,leadNumber);

      %transform to mv
      ECGmv_Physionet = data/200;

end