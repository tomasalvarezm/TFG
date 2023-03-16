%[kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean,averageIndex] = IndexForSignalWindows(ImportPhysionetData("1980518_acceptable.txt",2), originalFSPhysionet)


files = {'ECGRuido.txt','ECGNormal.txt'};
for i = 1:length(files) 
    file = files{i} ;
    [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean,averageIndex] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
    fprintf("%s : %f\n", file, mean (geometricMean));
end 