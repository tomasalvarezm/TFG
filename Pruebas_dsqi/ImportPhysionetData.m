%Imports data from the PhysioNet/Computing in Cardiology Challenge 2011
%
%It receives as arguments the name of the file to be imported (fileName)
% and the lead number (leadNumber)

function [ECGmv_Physionet] = ImportPhysionetData(fileName, leadNumber)
      ecg = importdata(fileName);
      data = ecg(:,leadNumber);

      %transform to mv
      ECGmv_Physionet = data/200;

end