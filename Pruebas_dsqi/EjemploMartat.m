files = {'M\n_Registro1_TopM_2023_10_19.txt', 'M\n_Registro2_TopM_2023-10-24_08-26-59.txt'};

[kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V_19,averageGeometricMean_19] = mSQI(ImportPluxData(files{1}, 3), 1000);
fprintf("Average mean of windows of %s: %f\n", files{1}, averageGeometricMean_19);


[kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V_24,averageGeometricMean_24] = mSQI(ImportPluxData(files{2}, 3), 1000);
fprintf("Average mean of windows of %s: %f\n", files{1}, averageGeometricMean_24);

alph=0.01
iter=1000
CIMedian = estimateCIMedian(geometricMean_V_19,geometricMean_V_24,alph,iter);
CIMean = estimateCIMean(geometricMean_V_19,geometricMean_V_24,alph,iter);
disp(CIMedian)
disp(CIMean)

histogram(geometricMean_V_19, 20)
figure()
histogram(geometricMean_V_24, 20)

