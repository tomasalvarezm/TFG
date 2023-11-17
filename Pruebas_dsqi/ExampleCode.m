
%Pluxo recordings with header
files = {'ECGNormal.txt'};
for i = 1:length(files) 
    file = files{i} ;
    [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = mSQI(ImportPluxData(file,3 ), 1000);
    fprintf("Average mean of windows of %s : %f\n", file, averageGeometricMean);
end 

%Physionet recordings
files = {'1980518_acceptable.txt'};
for i = 1:length(files) 
    file = files{i} ;
    for lead = 2:13
         [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = mSQI(ImportPhysionetData(file, lead), 500);
         fprintf("Average geometric mean of windows of %s, lead %i : %f\n", file, lead, averageGeometricMean);
    end
end 

%Bitalino recordings with multiple channels and without header
files = {'XXX_ECG13-03-8H.txt'};
for i=1:length(files)
    file = files{i};
    for channel = 3:5
        [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = mSQI(ImportPluxDataWithHeader(file, channel), 1000);
        fprintf("Average mean of windows of %s, channel %i : %f\n", file, channel, averageGeometricMean);
    end
end