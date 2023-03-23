%[kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean,averageIndex] = IndexForSignalWindows(ImportPhysionetData("1980518_acceptable.txt",2), originalFSPhysionet)

%Bitalino recordings
% files = {'ECGNormal.txt'};
% for i = 1:length(files) 
%     file = files{i} ;
%     fprintf("Indexes for windows of: %s\n",file);
%     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
%     [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean] = IndexForCompleteSignal(ImportBitalinoData(file),originalFSBitalino);
%     fprintf("Indexes for %s: kSQI:%f, sSQI:%f, pSQI:%f, SQI_rel_powerLine:%f, cSQI:%f, basSQI:%f, dSQI:%f, mean:%f\n ",file,kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean);
%     fprintf("Indexes for %s:  averageGeometricMean: %f  geometricMean %f\n ",file,averageGeometricMean, geometricMean);
% end 
% 
%Physionet recordings
files = {'set-a/1243537.txt'};


for i = 1:length(files) 
    file = files{i} ;
    for lead = 2:13
         [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportPhysionetData(file, lead), originalFSPhysionet);
         % fprintf("Indexes for %s, lead %i: kSQI:%f, sSQI:%f, pSQI:%f, SQI_rel_powerLine:%f, cSQI:%f, basSQI:%f, dSQI:%f, mean:%f\n ",file,lead,kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean);
          %fprintf("Indexes for %s, lead %i:  averageGeometricMean: %f \n ",file,lead,averageGeometricMean);
    end
end 

%Bitalino recordings with multiple channels 
% files = {'ECG13-03-8H.txt'};
% for i=1:length(files)
%     file = files{i};
%     for channel = 5:5
%       %  fprintf("Indexes for windows of %s, channel %i\n:",file,channel);
%         [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportDataMultipleChannels(file, channel), originalFSBitalino);
%         [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean] = IndexForCompleteSignal(ImportDataMultipleChannels(file,channel),originalFSBitalino);
%         %fprintf("Indexes for %s, channel %i: kSQI:%f, sSQI:%f, pSQI:%f, SQI_rel_powerLine:%f, cSQI:%f, basSQI:%f, dSQI:%f, mean:%f\n ",file,channel,kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean);
%         fprintf("Indexes for %s, channel %i:  averageGeometricMean: %f  geometricMean %f\n ",file,channel,averageGeometricMean, geometricMean);
% 
%     end
% end