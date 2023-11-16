files = {'XXX_ECG13-03-8H.txt'};
for i=1:length(files)
    file = files{i};
    for channel = 3:5
        [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = mSQI(ImportPluxDataWithHeader(file, channel), originalFSBitalino);
        fprintf("Average mean of windows of %s, channel %i : %f\n", file, channel, averageGeometricMean);
    end
end
