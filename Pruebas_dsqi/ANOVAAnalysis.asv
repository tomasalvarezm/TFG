
%Test1 
data_T1_top = ImportDataMultipleChannels('Test1.txt',3);
data_trabajando_T1_top = data_T1_top(1*60*1000+1:9*60*1000);
data_andando_T1_top = data_T1_top(11*60*1000+1:19*60*1000);
data_escaleras_T1_top = data_T1_top(21*60*1000+1:29*60*1000);

data_T1_camiseta = ImportDataMultipleChannels('Test1.txt',4);
data_trabajando_T1_camiseta = data_T1_camiseta(1*60*1000+1:9*60*1000);
data_andando_T1_camiseta = data_T1_camiseta(11*60*1000+1:19*60*1000);
data_escaleras_T1_camiseta = data_T1_camiseta(21*60*1000+1:29*60*1000);

data_T1_pantalon = ImportDataMultipleChannels('Test1.txt',5);
data_trabajando_T1_pantalon = data_T1_pantalon(1*60*1000+1:9*60*1000);
data_andando_T1_pantalon = data_T1_pantalon(11*60*1000+1:19*60*1000);
data_escaleras_T1_pantalon = data_T1_pantalon(21*60*1000+1:29*60*1000);

%Test2
data_T2_top = ImportDataMultipleChannels('Test2.txt',3);
data_andando_T2_top = data_T2_top(1*60*1000+1:9*60*1000);
data_escaleras_T2_top = data_T2_top(11*60*1000+1:19*60*1000);
data_trabajando_T2_top = data_T2_top(21*60*1000+1:29*60*1000);

data_T2_top = ImportDataMultipleChannels('Test2.txt',4);
data_andando_T2_camiseta = data_T2_top(1*60*1000+1:9*60*1000);
data_escaleras_T2_camiseta = data_T2_top(11*60*1000+1:19*60*1000);
data_trabajando_T2_camiseta = data_T2_top(21*60*1000+1:29*60*1000);

data_T2_pantalon = ImportDataMultipleChannels('Test2.txt',5);
data_andando_T2_pantalon = data_T2_pantalon(1*60*1000+1:9*60*1000);
data_escaleras_T2_pantalon = data_T2_pantalon(11*60*1000+1:19*60*1000);
data_trabajando_T2_pantalon = data_T2_pantalon(21*60*1000+1:29*60*1000);

%Test3
data_T3_top = ImportDataMultipleChannels('Test3.txt',3);
data_escaleras_T3_top = data_T3_top(1*60*1000+1:9*60*1000);
data_trabajando_T3_top = data_T3_top(11*60*1000+1:19*60*1000);
data_andando_T3_top = data_T3_top(21*60*1000+1:29*60*1000);

data_T3_camiseta = ImportDataMultipleChannels('Test3.txt',4);
data_escaleras_T3_camiseta = data_T3_camiseta(1*60*1000+1:9*60*1000);
data_trabajando_T3_camiseta = data_T3_camiseta(11*60*1000+1:19*60*1000);
data_andando_T3_camiseta = data_T3_camiseta(21*60*1000+1:29*60*1000);

data_T3_pantalon = ImportDataMultipleChannels('Test3.txt',5);
data_escaleras_T3_pantalon = data_T3_pantalon(1*60*1000+1:9*60*1000);
data_trabajando_T3_pantalon = data_T3_pantalon(11*60*1000+1:19*60*1000);
data_andando_T3_pantalon = data_T3_pantalon(21*60*1000+1:29*60*1000);

%ANOVA para cada una de las actividades 

%registros trabajando 
T1_trabajando = {data_trabajando_T1_top,data_trabajando_T1_camiseta,data_trabajando_T1_pantalon};
n = length(T1_trabajando);
indexes_trabajandoT1 = cell(1,n);

for i=1:n
    data = T1_trabajando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data, originalFSBitalino);
    indexes_trabajandoT1{i} = geometricMean_vector;
end

T2_trabajando = {data_trabajando_T2_top,data_trabajando_T2_camiseta,data_trabajando_T2_pantalon};
n = length(T2_trabajando);
indexes_trabajandoT2 = cell(1,n);

for i=1:n
    data = T2_trabajando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data, originalFSBitalino);
    indexes_trabajandoT2{i} = geometricMean_vector;
end

T3_trabajando = {data_trabajando_T3_top,data_trabajando_T3_camiseta,data_trabajando_T3_pantalon};
n = length(T3_trabajando);
indexes_trabajandoT3 = cell(1,n);

for i=1:n
    data = T3_trabajando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data, originalFSBitalino);
    indexes_trabajandoT3{i} = geometricMean_vector;
end

T1_t_ANOVA = cell2mat(indexes_trabajandoT1);
T2_t_ANOVA = cell2mat(indexes_trabajandoT2);
T3_t_ANOVA = cell2mat(indexes_trabajandoT3);
grupo = [repmat('T1',length(T1_t_ANOVA),1);repmat('T2',length(T2_t_ANOVA),1);repmat('T3',length(T3_t_ANOVA),1)];
p_trabajando = anova1([T1_t_ANOVA,T2_t_ANOVA,T3_t_ANOVA],grupo,"off");

%registros andando 
T1_andando = {data_andando_T1_top,data_andando_T1_camiseta,data_andando_T1_pantalon};
n = length(T1_andando);
indexes_andandoT1 = cell(1,n);
for i=1:n
    data = T1_andando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data, originalFSBitalino);
    indexes_andandoT1{i} = geometricMean_vector;
end

T2_andando = {data_andando_T2_top,data_andando_T2_camiseta,data_andando_T2_pantalon};
n = length(T2_andando);
indexes_andandoT2 = cell(1,n);
for i=1:n
    data = T2_andando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data, originalFSBitalino);
    indexes_andandoT2{i} = geometricMean_vector;
end

T3_andando = {data_andando_T3_top,data_andando_T3_camiseta,data_andando_T3_pantalon};
n = length(T3_andando);
indexes_andandoT3 = cell(1,n);
for i=1:n
    data = T3_andando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = IndexForSignalWindows(data, originalFSBitalino);
    indexes_andandoT3{i} = geometricMean_vector;
end

T1_a_ANOVA = cell2mat(indexes_andandoT1);
T2_a_ANOVA = cell2mat(indexes_andandoT2);
T3_a_ANOVA = cell2mat(indexes_andandoT3);
grupo = [repmat('T1',length(T1_a_ANOVA),1);repmat('T2',length(T2_a_ANOVA),1);repmat('T3',length(T3_a_ANOVA),1)];
p_andando = anova1([T1_a_ANOVA,T2_a_ANOVA,T3_a_ANOVA],grupo,"off");

%registros escaleras 
