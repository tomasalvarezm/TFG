time_vector = 1:((7*60 + 59)*60)*1000;

%top
top_Prueba1 = ImportDataMultipleChannels('ECG-30-03-8H.txt',3);
data_top_Prueba1 = top_Prueba1(time_vector);
top_Prueba2 = ImportDataMultipleChannels('ECG-01-06-8H.txt',3);
data_top_Prueba2 = top_Prueba2(time_vector);

data_top = {data_top_Prueba1,data_top_Prueba2};
n = length(data_top);
indexes_top = cell(1,n);
for i=1:n
    data = data_top{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, originalFSBitalino);
    indexes_top{i} = geometricMean_vector;
end

%camiseta 
camiseta_Prueba1 = ImportDataMultipleChannels('ECG-30-03-8H.txt',4);
data_camiseta_Prueba1 = camiseta_Prueba1(time_vector);
camiseta_Prueba2 = ImportDataMultipleChannels('ECG-01-06-8H.txt',4);
data_camiseta_Prueba2 = camiseta_Prueba2(time_vector);

data_camiseta = {data_camiseta_Prueba1,data_camiseta_Prueba2};
n = length(data_camiseta);
indexes_camiseta = cell(1,n);
for i=1:n
    data = data_camiseta{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, originalFSBitalino);
    indexes_camiseta{i} = geometricMean_vector;
end

%pantalon
pantalon_Prueba1 = ImportDataMultipleChannels('ECG-30-03-8H.txt',5);
data_pantalon_Prueba1 = pantalon_Prueba1(time_vector);
pantalon_Prueba2 = ImportDataMultipleChannels('ECG-01-06-8H.txt',5);
data_pantalon_Prueba2 = pantalon_Prueba2(time_vector);

data_pantalon = {data_pantalon_Prueba1,data_pantalon_Prueba2};
n = length(data_pantalon);
indexes_pantalon = cell(1,n);
for i=1:n
    data = data_pantalon{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, originalFSBitalino);
    indexes_pantalon{i} = geometricMean_vector;
end

%significance level for calculating the confidence intervals
alph = 0.01;
%number of iterations to use in boostrap
iter = 1000;

%CONFIDENCE INTERVALS TEST 30-03 VS 4-05

%confidence intervals for the top
CIMedian_topT4T15 = estimateCIMedian(indexes_top{1},indexes_top{2},alph,iter);
CIMean_topT4T15 = estimateCIMean(indexes_top{1},indexes_top{2},alph,iter);

%confidence intervals for the t-shirt
CIMedian_camT4T15 = estimateCIMedian(indexes_camiseta{1},indexes_camiseta{2},alph,iter);
CIMean_camT4T15 = estimateCIMean(indexes_camiseta{1},indexes_camiseta{2},alph,iter);

%confidence intervals for the pant
CIMedian_pantT4T15 = estimateCIMedian(indexes_pantalon{1},indexes_pantalon{2},alph,iter);
CIMean_pantT4T15 = estimateCIMean(indexes_pantalon{1},indexes_pantalon{2},alph,iter);