


%for complete signal
%[kSQI_01,sSQI_01, pSQI_01, SQI_rel_powerLine_01,cSQI_01, basSQI_01,dSQI_01,geometricMean,averageIndex] = IndexForCompleteSignal("1469157_setB.txt");


%for windows of 10s

[kSQI_01_vector,sSQI_01_vector, pSQI_01_vector, rel_powerLine01_vector,cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows("ECGNormal.txt");
