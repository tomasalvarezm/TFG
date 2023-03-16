%[kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean,averageIndex] = IndexForSignalWindows(ImportPhysionetData("1980518_acceptable.txt",2), originalFSPhysionet)

%Bitalino recordings
files = {'ECGRuido.txt','ECGNormal.txt'};
for i = 1:length(files) 
    file = files{i} ;
    [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean,averageIndex] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
    fprintf("%s : %f\n", file, mean (geometricMean));
end 

%Physionet recordings
files = {'1980518_acceptable.txt','1002603_unacceptable.txt'};
for i = 1:length(files) 
    file = files{i} ;
    for lead = 2:13
        [kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean,averageIndex] = IndexForSignalWindows(ImportPhysionetData(file, lead), originalFSPhysionet);
        fprintf("%s, lead %i : %f\n", file, lead, mean (geometricMean));
    end
end 