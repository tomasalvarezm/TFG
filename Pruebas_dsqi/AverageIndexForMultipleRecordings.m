
%Bitalino recordings
files = {'ECGNormal.txt'};
for i = 1:length(files) 
    file = files{i} ;
    [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
    fprintf("Average mean of windows of %s : %f\n", file, averageGeometricMean);
    [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean] = IndexForCompleteSignal(ImportBitalinoData(file),originalFSBitalino);
    fprintf("Mean for complete signal of %s : %f\n",file,geometricMean);
end 

%Physionet recordings
files = {'1980518_acceptable.txt'};
for i = 1:length(files) 
    file = files{i} ;
    for lead = 2:13
%         [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportPhysionetData(file, lead), originalFSPhysionet);
%         fprintf("Average geometric mean of windows of %s, lead %i : %f\n", file, lead, averageGeometricMean);
        [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean] = IndexForCompleteSignal(ImportPhysionetData(file,lead),originalFSPhysionet);
        fprintf("Mean for complete signal of %s, lead %i : %f\n", file, lead, geometricMean);
    end
end 

%Bitalino recordings with multiple channels 
files = {'ECG13-03-8H.txt'};
for i=1:length(files)
    file = files{i};
    for channel = 3:5
        [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportDataMultipleChannels(file, channel), originalFSBitalino);
        fprintf("Average mean of windows of %s, channel %i : %f\n", file, channel, averageGeometricMean);
        [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean] = IndexForCompleteSignal(ImportDataMultipleChannels(file,channel),originalFSBitalino);
        fprintf("Mean for complete signal of %s, chanel %i : %f\n",file,channel,geometricMean);

    end
end