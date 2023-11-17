

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
top_Prueba5 = ImportPluxDataWithHeader('ECG-25-04-8H.txt',3);
data_top_Prueba5 = top_Prueba5(time_vector);
top_Prueba6 = ImportPluxDataWithHeader('ECG-27-04-8H.txt',3);
data_top_Prueba6 = top_Prueba6(time_vector);
top_Prueba7 = ImportPluxDataWithHeader('ECG-4-05-8H.txt',3);
data_top_Prueba7 = top_Prueba7(time_vector);
top_Prueba8 = ImportPluxDataWithHeader('ECG-11-05-8H.txt',3);
data_top_Prueba8 = top_Prueba8(time_vector);
top_Prueba9 = ImportPluxDataWithHeader('ECG-15-05-8H.txt',3);
data_top_Prueba9 = top_Prueba9(time_vector);
top_Prueba10 = ImportPluxDataWithHeader('ECG-18-05-8H.txt',3);
data_top_Prueba10 = top_Prueba10(time_vector);
top_Prueba11 = ImportPluxDataWithHeader('ECG-20-05-8H.txt',3);
data_top_Prueba11 = top_Prueba11(time_vector);
top_Prueba12 = ImportPluxDataWithHeader('ECG-25-05-8H.txt',3);
data_top_Prueba12 = top_Prueba12(time_vector);
top_Prueba13 = ImportPluxDataWithHeader('ECG-27-05-8H.txt',3);
data_top_Prueba13 = top_Prueba13(time_vector);
top_Prueba14 = ImportPluxDataWithHeader('ECG-30-05-8H.txt',3);
data_top_Prueba14 = top_Prueba14(time_vector);
top_Prueba15 = ImportPluxDataWithHeader('ECG-01-06-8H.txt',3);
data_top_Prueba15 = top_Prueba15(time_vector);

data_top = {data_top_Prueba1,data_top_Prueba2,data_top_Prueba3,data_top_Prueba4,data_top_Prueba5,data_top_Prueba6,data_top_Prueba7,data_top_Prueba8,data_top_Prueba9,data_top_Prueba10,data_top_Prueba11,data_top_Prueba12,data_top_Prueba13,data_top_Prueba14,data_top_Prueba15};
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
camiseta_Prueba5 = ImportPluxDataWithHeader('ECG-25-04-8H.txt',4);
data_camiseta_Prueba5 = camiseta_Prueba2(time_vector);
camiseta_Prueba6 = ImportPluxDataWithHeader('ECG-27-04-8H.txt',4);
data_camiseta_Prueba6 = camiseta_Prueba3(time_vector);
camiseta_Prueba7 = ImportPluxDataWithHeader('ECG-4-05-8H.txt',4);
data_camiseta_Prueba7 = camiseta_Prueba2(time_vector);
camiseta_Prueba8 = ImportPluxDataWithHeader('ECG-11-05-8H.txt',4);
data_camiseta_Prueba8 = camiseta_Prueba8(time_vector);
camiseta_Prueba9 = ImportPluxDataWithHeader('ECG-15-05-8H.txt',4);
data_camiseta_Prueba9 = camiseta_Prueba9(time_vector);
camiseta_Prueba10 = ImportPluxDataWithHeader('ECG-18-05-8H.txt',4);
data_camiseta_Prueba10 = camiseta_Prueba10(time_vector);
camiseta_Prueba11 = ImportPluxDataWithHeader('ECG-20-05-8H.txt',4);
data_camiseta_Prueba11 = camiseta_Prueba11(time_vector);
camiseta_Prueba12 = ImportPluxDataWithHeader('ECG-25-05-8H.txt',4);
data_camiseta_Prueba12 = camiseta_Prueba12(time_vector);
camiseta_Prueba13 = ImportPluxDataWithHeader('ECG-27-05-8H.txt',4);
data_camiseta_Prueba13 = camiseta_Prueba13(time_vector);
camiseta_Prueba14 = ImportPluxDataWithHeader('ECG-30-05-8H.txt',4);
data_camiseta_Prueba14 = camiseta_Prueba14(time_vector);
camiseta_Prueba15 = ImportPluxDataWithHeader('ECG-01-06-8H.txt',4);
data_camiseta_Prueba15 = camiseta_Prueba15(time_vector);

data_camiseta = {data_camiseta_Prueba1,data_camiseta_Prueba2,data_camiseta_Prueba3,data_camiseta_Prueba4,data_camiseta_Prueba5,data_camiseta_Prueba6,data_camiseta_Prueba7,data_camiseta_Prueba8,data_camiseta_Prueba9,data_camiseta_Prueba10,data_camiseta_Prueba11,data_camiseta_Prueba12,data_camiseta_Prueba13,data_camiseta_Prueba14,data_camiseta_Prueba15};
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
pantalon_Prueba5 = ImportPluxDataWithHeader('ECG-25-04-8H.txt',5);
data_pantalon_Prueba5 = pantalon_Prueba2(time_vector);
pantalon_Prueba6 = ImportPluxDataWithHeader('ECG-27-04-8H.txt',5);
data_pantalon_Prueba6 = pantalon_Prueba3(time_vector);
pantalon_Prueba7 = ImportPluxDataWithHeader('ECG-4-05-8H.txt',5);
data_pantalon_Prueba7 = pantalon_Prueba2(time_vector);
pantalon_Prueba8 = ImportPluxDataWithHeader('ECG-11-05-8H.txt',5);
data_pantalon_Prueba8 = pantalon_Prueba8(time_vector);
pantalon_Prueba9 = ImportPluxDataWithHeader('ECG-15-05-8H.txt',5);
data_pantalon_Prueba9 = pantalon_Prueba9(time_vector);
pantalon_Prueba10 = ImportPluxDataWithHeader('ECG-18-05-8H.txt',5);
data_pantalon_Prueba10 = pantalon_Prueba10(time_vector);
pantalon_Prueba11 = ImportPluxDataWithHeader('ECG-20-05-8H.txt',5);
data_pantalon_Prueba11 = pantalon_Prueba11(time_vector);
pantalon_Prueba12 = ImportPluxDataWithHeader('ECG-25-05-8H.txt',5);
data_pantalon_Prueba12 = pantalon_Prueba12(time_vector);
pantalon_Prueba13 = ImportPluxDataWithHeader('ECG-27-05-8H.txt',5);
data_pantalon_Prueba13 = pantalon_Prueba13(time_vector);
pantalon_Prueba14 = ImportPluxDataWithHeader('ECG-30-05-8H.txt',5);
data_pantalon_Prueba14 = pantalon_Prueba14(time_vector);
pantalon_Prueba15 = ImportPluxDataWithHeader('ECG-01-06-8H.txt',5);
data_pantalon_Prueba15 = pantalon_Prueba15(time_vector);

data_pantalon = {data_pantalon_Prueba1,data_pantalon_Prueba2,data_pantalon_Prueba3,data_pantalon_Prueba4,data_pantalon_Prueba5,data_pantalon_Prueba6,data_pantalon_Prueba7,data_pantalon_Prueba8,data_pantalon_Prueba9,data_pantalon_Prueba10,data_pantalon_Prueba11,data_pantalon_Prueba12,data_pantalon_Prueba13,data_pantalon_Prueba14,data_pantalon_Prueba15};
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


%comparación de el último registro antes de lavar (30-03) y de los
%registros tras el primer lavado (25-04 y 27-04)

%top
CIMedian_topT4T5 = estimateCIMedian(indexes_top{4},indexes_top{5},alph,iter);
CIMean_topT4T5 = estimateCIMean(indexes_top{4},indexes_top{5},alph,iter);

%t-shirt
CIMedian_camT4T5 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{5},alph,iter);
CIMean_camT4T5 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{5},alph,iter);

%pant
CIMedian_pantT4T5 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{5},alph,iter);
CIMean_pantT4T5 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{5},alph,iter);

%top
CIMedian_topT4T6 = estimateCIMedian(indexes_top{4},indexes_top{6},alph,iter);
CIMean_topT4T6 = estimateCIMean(indexes_top{4},indexes_top{6},alph,iter);

%t-shirt
CIMedian_camT4T6 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{6},alph,iter);
CIMean_camT4T6 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{6},alph,iter);

%pant
CIMedian_pantT4T6 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{6},alph,iter);
CIMean_pantT4T6 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{6},alph,iter);

%comparación del último registro antes de lavar (30-03) y el registro tras
%el segundo lavado (4-05)

%top
CIMedian_topT4T7 = estimateCIMedian(indexes_top{4},indexes_top{7},alph,iter);
CIMean_topT4T7 = estimateCIMean(indexes_top{4},indexes_top{7},alph,iter);

%t-shirt
CIMedian_camT4T7 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{7},alph,iter);
CIMean_camT4T7 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{7},alph,iter);

%pant
CIMedian_pantT4T7 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{7},alph,iter);
CIMean_pantT4T7 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{7},alph,iter);

%top
CIMedian_topT4T8 = estimateCIMedian(indexes_top{4},indexes_top{8},alph,iter);
CIMean_topT4T8 = estimateCIMean(indexes_top{4},indexes_top{8},alph,iter);

%t-shirt
CIMedian_camT4T8 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{8},alph,iter);
CIMean_camT4T8 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{8},alph,iter);

%pant
CIMedian_pantT4T8 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{8},alph,iter);
CIMean_pantT4T8 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{8},alph,iter);


%top
CIMedian_topT4T9 = estimateCIMedian(indexes_top{4},indexes_top{9},alph,iter);
CIMean_topT4T9 = estimateCIMean(indexes_top{4},indexes_top{9},alph,iter);

%t-shirt
CIMedian_camT4T9 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{9},alph,iter);
CIMean_camT4T9 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{9},alph,iter);

%pant
CIMedian_pantT4T9 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{9},alph,iter);
CIMean_pantT4T9 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{9},alph,iter);

%top
CIMedian_topT4T10 = estimateCIMedian(indexes_top{4},indexes_top{10},alph,iter);
CIMean_topT4T10 = estimateCIMean(indexes_top{4},indexes_top{10},alph,iter);

%t-shirt
CIMedian_camT4T10 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{10},alph,iter);
CIMean_camT4T10 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{10},alph,iter);

%pant
CIMedian_pantT4T10 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{10},alph,iter);
CIMean_pantT4T10 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{10},alph,iter);

%top
CIMedian_topT4T11 = estimateCIMedian(indexes_top{4},indexes_top{11},alph,iter);
CIMean_topT4T11 = estimateCIMean(indexes_top{4},indexes_top{11},alph,iter);

%t-shirt
CIMedian_camT4T11 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{11},alph,iter);
CIMean_camT4T11 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{11},alph,iter);

%pant
CIMedian_pantT4T11 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{11},alph,iter);
CIMean_pantT4T11 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{11},alph,iter);

%top
CIMedian_topT4T12 = estimateCIMedian(indexes_top{4},indexes_top{12},alph,iter);
CIMean_topT4T12 = estimateCIMean(indexes_top{4},indexes_top{12},alph,iter);

%t-shirt
CIMedian_camT4T12 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{12},alph,iter);
CIMean_camT4T12 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{12},alph,iter);

%pant
CIMedian_pantT4T12 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{12},alph,iter);
CIMean_pantT4T12 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{12},alph,iter);

%top
CIMedian_topT4T13 = estimateCIMedian(indexes_top{4},indexes_top{13},alph,iter);
CIMean_topT4T13 = estimateCIMean(indexes_top{4},indexes_top{13},alph,iter);

%t-shirt
CIMedian_camT4T13 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{13},alph,iter);
CIMean_camT4T13 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{13},alph,iter);

%pant
CIMedian_pantT4T13 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{13},alph,iter);
CIMean_pantT4T13 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{13},alph,iter);

% top
CIMedian_topT4T14 = estimateCIMedian(indexes_top{4},indexes_top{14},alph,iter);
CIMean_topT4T14 = estimateCIMean(indexes_top{4},indexes_top{14},alph,iter);

% t-shirt
CIMedian_camT4T14 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{14},alph,iter);
CIMean_camT4T14 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{14},alph,iter);

% pant
CIMedian_pantT4T14 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{14},alph,iter);
CIMean_pantT4T14 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{14},alph,iter);


% top
CIMedian_topT4T15 = estimateCIMedian(indexes_top{4},indexes_top{15},alph,iter);
CIMean_topT4T15 = estimateCIMean(indexes_top{4},indexes_top{15},alph,iter);

% t-shirt
CIMedian_camT4T15 = estimateCIMedian(indexes_camiseta{4},indexes_camiseta{15},alph,iter);
CIMean_camT4T15 = estimateCIMean(indexes_camiseta{4},indexes_camiseta{15},alph,iter);

% pant
CIMedian_pantT4T15 = estimateCIMedian(indexes_pantalon{4},indexes_pantalon{15},alph,iter);
CIMean_pantT4T15 = estimateCIMean(indexes_pantalon{4},indexes_pantalon{15},alph,iter);


