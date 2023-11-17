
time_vector = 1:((7*60 + 59)*60)*1000;

%top
top_Prueba1 = ImportDataMultipleChannels('ECG13-03-8H.txt',3);
data_top_Prueba1 = top_Prueba1(time_vector);
top_Prueba2 = ImportDataMultipleChannels('ECG-25-03-8H.txt',3);
data_top_Prueba2 = top_Prueba2(time_vector);
top_Prueba3 = ImportDataMultipleChannels('ECG-28-03-8H.txt',3);
data_top_Prueba3 = top_Prueba3(time_vector);
top_Prueba4 = ImportDataMultipleChannels('ECG-30-03-8H.txt',3);
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
camiseta_Prueba1 = ImportDataMultipleChannels('ECG13-03-8H.txt',4);
data_camiseta_Prueba1 = camiseta_Prueba1(time_vector);
camiseta_Prueba2 = ImportDataMultipleChannels('ECG-25-03-8H.txt',4);
data_camiseta_Prueba2 = camiseta_Prueba2(time_vector);
camiseta_Prueba3 = ImportDataMultipleChannels('ECG-28-03-8H.txt',4);
data_camiseta_Prueba3 = camiseta_Prueba3(time_vector);
camiseta_Prueba4 = ImportDataMultipleChannels('ECG-30-03-8H.txt',4);
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
pantalon_Prueba1 = ImportDataMultipleChannels('ECG13-03-8H.txt',5);
data_pantalon_Prueba1 = pantalon_Prueba1(time_vector);
pantalon_Prueba2 = ImportDataMultipleChannels('ECG-25-03-8H.txt',5);
data_pantalon_Prueba2 = pantalon_Prueba2(time_vector);
pantalon_Prueba3 = ImportDataMultipleChannels('ECG-28-03-8H.txt',5);
data_pantalon_Prueba3 = pantalon_Prueba3(time_vector);
pantalon_Prueba4 = ImportDataMultipleChannels('ECG-30-03-8H.txt',5);
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

%Prueba 1
CI_topcam_1 = estimateCIMedian(indexes_top{1},indexes_camiseta{1}, alph, iter);
CI_toppant_1 = estimateCIMedian(indexes_top{1},indexes_pantalon{1}, alph, iter);
CI_campant_1 = estimateCIMedian(indexes_camiseta{1},indexes_pantalon{1}, alph, iter);

%Prueba 2
CI_topcam_2 = estimateCIMedian(indexes_top{2},indexes_camiseta{2}, alph, iter);
CI_toppant_2 = estimateCIMedian(indexes_top{2},indexes_pantalon{2}, alph, iter);
CI_campant_2 = estimateCIMedian(indexes_camiseta{2},indexes_pantalon{2}, alph, iter);

%Prueba 3
CI_topcam_3 = estimateCIMedian(indexes_top{3},indexes_camiseta{3}, alph, iter);
CI_toppant_3 = estimateCIMedian(indexes_top{3},indexes_pantalon{3}, alph, iter);
CI_campant_3 = estimateCIMedian(indexes_camiseta{3},indexes_pantalon{3}, alph, iter);

%Prueba 4
CI_topcam_4 = estimateCIMedian(indexes_top{4},indexes_camiseta{4}, alph, iter);
CI_toppant_4 = estimateCIMedian(indexes_top{4},indexes_pantalon{4}, alph, iter);
CI_campant_4 = estimateCIMedian(indexes_camiseta{4},indexes_pantalon{4}, alph, iter);

% todas las pruebas
CI_topcam = estimateCIMedian([indexes_top{1}, indexes_top{2}, indexes_top{3}, indexes_top{4}], [indexes_camiseta{1}, indexes_camiseta{2}, indexes_camiseta{3},indexes_camiseta{4}], alph, iter);
CI_toppant = estimateCIMedian([indexes_top{1}, indexes_top{2}, indexes_top{3}, indexes_top{4}], [indexes_pantalon{1},indexes_pantalon{2},indexes_pantalon{3},indexes_pantalon{4}], alph, iter);
CI_campant = estimateCIMedian([indexes_camiseta{1}, indexes_camiseta{2}, indexes_camiseta{3},indexes_camiseta{4}], [indexes_pantalon{1},indexes_pantalon{2},indexes_pantalon{3},indexes_pantalon{4}], alph, iter);


%Prueba 1
CI_Mean_topcam_1 = estimateCIMean(indexes_top{1},indexes_camiseta{1}, alph, iter);
CI_Mean_toppant_1 = estimateCIMean(indexes_top{1},indexes_pantalon{1}, alph, iter);
CI_Mean_campant_1 = estimateCIMean(indexes_camiseta{1},indexes_pantalon{1}, alph, iter);

%Prueba 2
CI_Mean_topcam_2 = estimateCIMean(indexes_top{2},indexes_camiseta{2}, alph, iter);
CI_Mean_toppant_2 = estimateCIMean(indexes_top{2},indexes_pantalon{2}, alph, iter);
CI_Mean_campant_2 = estimateCIMean(indexes_camiseta{2},indexes_pantalon{2}, alph, iter);

%Prueba 3
CI_Mean_topcam_3 = estimateCIMean(indexes_top{3},indexes_camiseta{3}, alph, iter);
CI_Mean_toppant_3 = estimateCIMean(indexes_top{3},indexes_pantalon{3}, alph, iter);
CI_Mean_campant_3 = estimateCIMean(indexes_camiseta{3},indexes_pantalon{3}, alph, iter);

%Prueba 4
CI_Mean_topcam_4 = estimateCIMean(indexes_top{4},indexes_camiseta{4}, alph, iter);
CI_Mean_toppant_4 = estimateCIMean(indexes_top{4},indexes_pantalon{4}, alph, iter);
CI_Mean_campant_4 = estimateCIMean(indexes_camiseta{4},indexes_pantalon{4}, alph, iter);

% todas las pruebas
CI_Mean_topcam = estimateCIMean([indexes_top{1}, indexes_top{2}, indexes_top{3}, indexes_top{4}], [indexes_camiseta{1}, indexes_camiseta{2}, indexes_camiseta{3},indexes_camiseta{4}], alph, iter);
CI_Mean_toppant = estimateCIMean([indexes_top{1}, indexes_top{2}, indexes_top{3}, indexes_top{4}], [indexes_pantalon{1},indexes_pantalon{2},indexes_pantalon{3},indexes_pantalon{4}], alph, iter);
CI_Mean_campant = estimateCIMean([indexes_camiseta{1}, indexes_camiseta{2}, indexes_camiseta{3},indexes_camiseta{4}], [indexes_pantalon{1},indexes_pantalon{2},indexes_pantalon{3},indexes_pantalon{4}], alph, iter);







