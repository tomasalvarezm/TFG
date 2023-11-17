
time_vector = 1:((7*60 + 59)*60)*1000;

%top
top_Prueba1 = ImportPluxDataWithHeader('ECG13-03-8H.txt',3);
data_top_Prueba1 = top_Prueba1(time_vector);
top_Prueba2 = ImportPluxDataWithHeader('ECG-25-03-8H.txt',3);
data_top_Prueba2 = top_Prueba2(time_vector);
top_Prueba3 = ImportPluxDataWithHeader('ECG-28-03-8H.txt',3);
data_top_Prueba3 = top_Prueba3(time_vector);
top_Prueba4 = ImportPluxDataWithHeader('ECG-30-03-8H.txt',3);
data_top_Prueba4 = top_Prueba4(time_vector);

data_top = {data_top_Prueba1,data_top_Prueba2,data_top_Prueba3,data_top_Prueba4};
n = length(data_top);
indexes_top = cell(1,n);
for i=1:n
    data = data_top{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_top{i} = geometricMean_vector;
end

%camiseta 
camiseta_Prueba1 = ImportPluxDataWithHeader('ECG13-03-8H.txt',4);
data_camiseta_Prueba1 = camiseta_Prueba1(time_vector);
camiseta_Prueba2 = ImportPluxDataWithHeader('ECG-25-03-8H.txt',4);
data_camiseta_Prueba2 = camiseta_Prueba2(time_vector);
camiseta_Prueba3 = ImportPluxDataWithHeader('ECG-28-03-8H.txt',4);
data_camiseta_Prueba3 = camiseta_Prueba3(time_vector);
camiseta_Prueba4 = ImportPluxDataWithHeader('ECG-30-03-8H.txt',4);
data_camiseta_Prueba4 = camiseta_Prueba4(time_vector);

data_camiseta = {data_camiseta_Prueba1,data_camiseta_Prueba2,data_camiseta_Prueba3,data_camiseta_Prueba4};
n = length(data_camiseta);
indexes_camiseta = cell(1,n);
for i=1:n
    data = data_camiseta{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_camiseta{i} = geometricMean_vector;
end

%pantalon
pantalon_Prueba1 = ImportPluxDataWithHeader('ECG13-03-8H.txt',5);
data_pantalon_Prueba1 = pantalon_Prueba1(time_vector);
pantalon_Prueba2 = ImportPluxDataWithHeader('ECG-25-03-8H.txt',5);
data_pantalon_Prueba2 = pantalon_Prueba2(time_vector);
pantalon_Prueba3 = ImportPluxDataWithHeader('ECG-28-03-8H.txt',5);
data_pantalon_Prueba3 = pantalon_Prueba3(time_vector);
pantalon_Prueba4 = ImportPluxDataWithHeader('ECG-30-03-8H.txt',5);
data_pantalon_Prueba4 = pantalon_Prueba4(time_vector);

data_pantalon = {data_pantalon_Prueba1,data_pantalon_Prueba2,data_pantalon_Prueba3,data_pantalon_Prueba4};
n = length(data_pantalon);
indexes_pantalon = cell(1,n);
for i=1:n
    data = data_pantalon{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_pantalon{i} = geometricMean_vector;
end


%significance level for calculating the confidence intervals
alph = 0.01;
%number of iterations to use in boostrap
iter = 1000;

data_top_LT2LT3LT4 = [indexes_top{2},indexes_top{3},indexes_top{4}];
data_camiseta_LT2LT3LT4 = [indexes_camiseta{2},indexes_camiseta{3},indexes_camiseta{4}];
data_pant_LT2LT3LT4 = [indexes_pantalon{2},indexes_pantalon{3},indexes_pantalon{4}];

data_top_LT1LT3LT4 = [indexes_top{1},indexes_top{3},indexes_top{4}];
data_camiseta_LT1LT3LT4 = [indexes_camiseta{1},indexes_camiseta{3},indexes_camiseta{4}];
data_pant_LT1LT3LT4 = [indexes_pantalon{1},indexes_pantalon{3},indexes_pantalon{4}];

data_top_LT1LT2LT4 = [indexes_top{1},indexes_top{2},indexes_top{4}];
data_camiseta_LT1LT2LT4 = [indexes_camiseta{1},indexes_camiseta{2},indexes_camiseta{4}];
data_pant_LT1LT2LT4 = [indexes_pantalon{1},indexes_pantalon{2},indexes_pantalon{4}];

data_top_LT1LT2LT3 = [indexes_top{1},indexes_top{2},indexes_top{3}];
data_camiseta_LT1LT2LT3 = [indexes_camiseta{1},indexes_camiseta{2},indexes_camiseta{3}];
data_pant_LT1LT2LT3 = [indexes_pantalon{1},indexes_pantalon{2},indexes_pantalon{3}];

%CI para LT1 vs {LT2, LT3 y LT4}
Mean_top_LT1vsLT2LT3LT4 = estimateCIMean(indexes_top{1},data_top_LT2LT3LT4,alph,iter);
Median_top_LT1vsLT2LT3LT4 = estimateCIMedian(indexes_top{1},data_top_LT2LT3LT4,alph,iter);

Mean_cam_LT1vsLT2LT3LT4 = estimateCIMean(indexes_camiseta{1},data_camiseta_LT2LT3LT4,alph,iter);
Median_cam_LT1vsLT2LT3LT4 = estimateCIMedian(indexes_camiseta{1},data_camiseta_LT2LT3LT4,alph,iter);

Mean_pant_LT1vsLT2LT3LT4 = estimateCIMean(indexes_pantalon{1},data_pant_LT2LT3LT4,alph,iter);
Median_pant_LT1vsLT2LT3LT4 = estimateCIMedian(indexes_pantalon{1},data_pant_LT2LT3LT4,alph,iter);

%CI para LT2 vs {LT1,LT3 y LT4}
Mean_top_LT2vsLT1LT3LT4 = estimateCIMean(indexes_top{2},data_top_LT1LT3LT4,alph,iter);
Median_top_LT2vsLT1LT3LT4 = estimateCIMedian(indexes_top{2},data_top_LT1LT3LT4,alph,iter);

Mean_cam_LT2vsLT1LT3LT4 = estimateCIMean(indexes_camiseta{2},data_camiseta_LT1LT3LT4,alph,iter);
Median_cam_LT2vsLT1LT3LT4 = estimateCIMedian(indexes_camiseta{2},data_camiseta_LT1LT3LT4,alph,iter);

Mean_pant_LT2vsLT1LT3LT4 = estimateCIMean(indexes_pantalon{2},data_pant_LT1LT3LT4,alph,iter);
Median_pant_LT2vsLT1LT3LT4 = estimateCIMedian(indexes_pantalon{2},data_pant_LT1LT3LT4,alph,iter);

%CI para LT3 vs {LT1,LT2 y LT4}
Mean_top_LT3vsLT1LT2LT4 = estimateCIMean(indexes_top{3},data_top_LT1LT2LT4,alph,iter);
Median_top_LT3vsLT1LT2LT4 = estimateCIMedian(indexes_top{3},data_top_LT1LT2LT4,alph,iter);

Mean_cam_LT3vsLT1LT2LT4 = estimateCIMean(indexes_camiseta{3},data_camiseta_LT1LT2LT4,alph,iter);
Median_cam_LT3vsLT1LT2LT4 = estimateCIMedian(indexes_camiseta{3},data_camiseta_LT1LT2LT4,alph,iter);

Mean_pant_LT3vsLT1LT2LT4 = estimateCIMean(indexes_pantalon{3},data_pant_LT1LT2LT4,alph,iter);
Median_pant_LT3vsLT1LT2LT4 = estimateCIMedian(indexes_pantalon{3},data_pant_LT1LT2LT4,alph,iter);

%CI para LT4 vs {LT1,LT2,LT3}
Mean_top_LT4vsLT1LT2LT3 = estimateCIMean(indexes_top{4},data_top_LT1LT2LT3,alph,iter);
Median_top_LT4vsLT1LT2LT3 = estimateCIMedian(indexes_top{4},data_top_LT1LT2LT3,alph,iter);

Mean_cam_LT4vsLT1LT2LT3 = estimateCIMean(indexes_camiseta{4},data_camiseta_LT1LT2LT3,alph,iter);
Median_cam_LT4vsLT1LT2LT3 = estimateCIMedian(indexes_camiseta{4},data_camiseta_LT1LT2LT3,alph,iter);

Mean_pant_LT4vsLT1LT2LT3 = estimateCIMean(indexes_pantalon{4},data_pant_LT1LT2LT3,alph,iter);
Median_pant_LT4vsLT1LT2LT3 = estimateCIMedian(indexes_pantalon{4},data_pant_LT1LT2LT3,alph,iter);
