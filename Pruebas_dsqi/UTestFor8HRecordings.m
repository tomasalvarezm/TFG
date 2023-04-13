
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
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data, originalFSBitalino);
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
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data, originalFSBitalino);
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
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data, originalFSBitalino);
    indexes_pantalon{i} = geometricMean_vector;
end

%Prueba 1
[p_topcam_1,U_topcam_1] = Utest(indexes_top{1},indexes_camiseta{1});
[p_toppant_1,U_toppant_1] = Utest(indexes_top{1},indexes_pantalon{1});
[p_campant_1,U_campant_1] = Utest(indexes_camiseta{1},indexes_pantalon{1});

%Prueba 2
[p_topcam_2,U_topcam_2] = Utest(indexes_top{2},indexes_camiseta{2});
[p_toppant_2,U_toppant_2] = Utest(indexes_top{2},indexes_pantalon{2});
[p_campant_2,U_campant_2] = Utest(indexes_camiseta{2},indexes_pantalon{2});

%Prueba 3
[p_topcam_3,U_topcam_3] = Utest(indexes_top{3},indexes_camiseta{3});
[p_toppant_3,U_toppant_3] = Utest(indexes_top{3},indexes_pantalon{3});
[p_campant_3,U_campant_3] = Utest(indexes_camiseta{3},indexes_pantalon{3});

%Prueba 4
[p_topcam_4,U_topcam_4] = Utest(indexes_top{4},indexes_camiseta{4});
[p_toppant_4,U_toppant_4] = Utest(indexes_top{4},indexes_pantalon{4});
[p_campant_4,U_campant_4] = Utest(indexes_camiseta{4},indexes_pantalon{4});

function [pvalue_vector,U_vector] = Utest(index_vector1,index_vector2)
nboot = 1;
pvalue_vector = zeros(0,999);
U_vector = zeros(0,999);
for i=1:1000
    index_vector1_b = bootstrp(nboot,@(x) x,index_vector1);
    index_vector2_b = bootstrp(nboot,@(x) x, index_vector2);
    [pval,Uval] = calculateUandP(index_vector1_b,index_vector2_b);
    pvalue_vector(i) = pval;
    U_vector(i) = Uval;
end
end

function [pval,Uval] = calculateUandP(v1,v2)
 n = length(v1);
 [p,h,stats] = ranksum(v1,v2);
 pval = p;
 W = stats.ranksum;
 Uval = W - ((n*(n+1))/2);
end






