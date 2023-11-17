
% fileName = "ANOVAAnalysis.txt";
% ANOVAFile = fopen(fileName,'w+');
%Test1 
data_T1_top = ImportPluxDataWithHeader('Test1.txt',3);
data_trabajando_T1_top = data_T1_top(1*60*1000+1:9*60*1000);
data_andando_T1_top = data_T1_top(11*60*1000+1:19*60*1000);
data_escaleras_T1_top = data_T1_top(21*60*1000+1:29*60*1000);

data_T1_camiseta = ImportPluxDataWithHeader('Test1.txt',4);
data_trabajando_T1_camiseta = data_T1_camiseta(1*60*1000+1:9*60*1000);
data_andando_T1_camiseta = data_T1_camiseta(11*60*1000+1:19*60*1000);
data_escaleras_T1_camiseta = data_T1_camiseta(21*60*1000+1:29*60*1000);

data_T1_pantalon = ImportPluxDataWithHeader('Test1.txt',5);
data_trabajando_T1_pantalon = data_T1_pantalon(1*60*1000+1:9*60*1000);
data_andando_T1_pantalon = data_T1_pantalon(11*60*1000+1:19*60*1000);
data_escaleras_T1_pantalon = data_T1_pantalon(21*60*1000+1:29*60*1000);

%Test2
data_T2_top = ImportPluxDataWithHeader('Test2.txt',3);
data_andando_T2_top = data_T2_top(1*60*1000+1:9*60*1000);
data_escaleras_T2_top = data_T2_top(11*60*1000+1:19*60*1000);
data_trabajando_T2_top = data_T2_top(21*60*1000+1:29*60*1000);

data_T2_top = ImportPluxDataWithHeader('Test2.txt',4);
data_andando_T2_camiseta = data_T2_top(1*60*1000+1:9*60*1000);
data_escaleras_T2_camiseta = data_T2_top(11*60*1000+1:19*60*1000);
data_trabajando_T2_camiseta = data_T2_top(21*60*1000+1:29*60*1000);

data_T2_pantalon = ImportPluxDataWithHeader('Test2.txt',5);
data_andando_T2_pantalon = data_T2_pantalon(1*60*1000+1:9*60*1000);
data_escaleras_T2_pantalon = data_T2_pantalon(11*60*1000+1:19*60*1000);
data_trabajando_T2_pantalon = data_T2_pantalon(21*60*1000+1:29*60*1000);

%Test3
data_T3_top = ImportPluxDataWithHeader('Test3.txt',3);
data_escaleras_T3_top = data_T3_top(1*60*1000+1:9*60*1000);
data_trabajando_T3_top = data_T3_top(11*60*1000+1:19*60*1000);
data_andando_T3_top = data_T3_top(21*60*1000+1:29*60*1000);

data_T3_camiseta = ImportPluxDataWithHeader('Test3.txt',4);
data_escaleras_T3_camiseta = data_T3_camiseta(1*60*1000+1:9*60*1000);
data_trabajando_T3_camiseta = data_T3_camiseta(11*60*1000+1:19*60*1000);
data_andando_T3_camiseta = data_T3_camiseta(21*60*1000+1:29*60*1000);

data_T3_pantalon = ImportPluxDataWithHeader('Test3.txt',5);
data_escaleras_T3_pantalon = data_T3_pantalon(1*60*1000+1:9*60*1000);
data_trabajando_T3_pantalon = data_T3_pantalon(11*60*1000+1:19*60*1000);
data_andando_T3_pantalon = data_T3_pantalon(21*60*1000+1:29*60*1000);

%[kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = mSQI(data_trabajando_T1_pantalon, 1000);

%registros trabajando 
T1_trabajando = {data_trabajando_T1_top,data_trabajando_T1_camiseta,data_trabajando_T1_pantalon};
n = length(T1_trabajando);
indexes_trabajandoT1 = cell(1,n);

for i=1:n
    data = T1_trabajando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_trabajandoT1{i} = geometricMean_vector;
end

% fprintf(ANOVAFile,'[');
% fprintf(ANOVAFile,'%f ',indexes_trabajandoT1{1});
% fprintf(ANOVAFile,']');

T2_trabajando = {data_trabajando_T2_top,data_trabajando_T2_camiseta,data_trabajando_T2_pantalon};
n = length(T2_trabajando);
indexes_trabajandoT2 = cell(1,n);

for i=1:n
    data = T2_trabajando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_trabajandoT2{i} = geometricMean_vector;
end

T3_trabajando = {data_trabajando_T3_top,data_trabajando_T3_camiseta,data_trabajando_T3_pantalon};
n = length(T3_trabajando);
indexes_trabajandoT3 = cell(1,n);

for i=1:n
    data = T3_trabajando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_trabajandoT3{i} = geometricMean_vector;
end

%registros andando 
T1_andando = {data_andando_T1_top,data_andando_T1_camiseta,data_andando_T1_pantalon};
n = length(T1_andando);
indexes_andandoT1 = cell(1,n);
for i=1:n
    data = T1_andando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_andandoT1{i} = geometricMean_vector;
end

T2_andando = {data_andando_T2_top,data_andando_T2_camiseta,data_andando_T2_pantalon};
n = length(T2_andando);
indexes_andandoT2 = cell(1,n);
for i=1:n
    data = T2_andando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_andandoT2{i} = geometricMean_vector;
end

T3_andando = {data_andando_T3_top,data_andando_T3_camiseta,data_andando_T3_pantalon};
n = length(T3_andando);
indexes_andandoT3 = cell(1,n);
for i=1:n
    data = T3_andando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_andandoT3{i} = geometricMean_vector;
end

%registros escaleras 
T1_escaleras = {data_escaleras_T1_top,data_escaleras_T1_camiseta,data_escaleras_T1_pantalon};
n = length(T1_escaleras);
indexes_escalerasT1 = cell(1,n);
for i=1:n
    data = T1_escaleras{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_escalerasT1{i} = geometricMean_vector;
end

T2_escaleras = {data_escaleras_T2_top,data_escaleras_T2_camiseta,data_escaleras_T2_pantalon};
n = length(T2_escaleras);
indexes_escalerasT2 = cell(1,n);
for i=1:n
    data = T2_escaleras{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_escalerasT2{i} = geometricMean_vector;
end

T3_escaleras = {data_escaleras_T3_top,data_escaleras_T3_camiseta,data_escaleras_T3_pantalon};
n = length(T3_escaleras);
indexes_escalerasT3 = cell(1,n);
for i=1:n
    data = T3_escaleras{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_escalerasT3{i} = geometricMean_vector;
end

%ANOVA Analysis 
group_length = 48;
group = [repmat('T1',group_length,1);repmat('T2',group_length,1);repmat('T3',group_length,1)];

%ANOVA top trabajando
top_t = [indexes_trabajandoT1{1},indexes_trabajandoT2{1},indexes_trabajandoT3{1}];
p_top_t = anova1(top_t,group,"off");
fprintf("P-value para top trabajando: %f\n",p_top_t);

%ANOVA top andando
top_a = [indexes_andandoT1{1},indexes_andandoT2{1},indexes_andandoT3{1}];
p_top_a = anova1(top_a,group,"off");
fprintf("P-value para top andando: %f\n",p_top_a);

%ANOVA top escaleras 
top_e = [indexes_escalerasT1{1},indexes_escalerasT2{1},indexes_escalerasT3{1}];
p_top_e = anova1(top_e,group,"off");
fprintf("P-value para top escaleras: %f\n",p_top_e);

%ANOVA camiseta trabajando
camiseta_t = [indexes_trabajandoT1{2},indexes_trabajandoT2{2},indexes_trabajandoT3{2}];
p_camiseta_t = anova1(camiseta_t,group,"off");
fprintf("P-value para camiseta trabajando: %f\n",p_camiseta_t);

%ANOVA camiseta andando
camiseta_a = [indexes_andandoT1{2},indexes_andandoT2{2},indexes_andandoT3{2}];
p_camiseta_a = anova1(camiseta_a,group,"off");
fprintf("P-value para camiseta andando: %f\n",p_camiseta_a);

%ANOVA camiseta escaleras
camiseta_e = [indexes_escalerasT1{2},indexes_escalerasT2{2},indexes_escalerasT3{2}];
p_camiseta_e = anova1(camiseta_e,group,"off");
fprintf("P-value para camiseta escaleras: %f\n",p_camiseta_e);

%ANOVA pantalón trabajando
pantalon_t = [indexes_trabajandoT1{3},indexes_trabajandoT2{3},indexes_trabajandoT3{3}];
p_pantalon_t = anova1(pantalon_t,group,"off");
fprintf("P-value para pantalon trabajando: %f\n",p_pantalon_t);

%ANOVA pantalón andando
pantalon_a = [indexes_andandoT1{3},indexes_andandoT2{3},indexes_andandoT3{3}];
p_pantalon_a = anova1(pantalon_a,group,"off");
fprintf("P-value para pantalon andando: %f\n",p_pantalon_a);

%ANOVA pantalón escaleras
pantalon_e = [indexes_escalerasT1{3},indexes_escalerasT2{3},indexes_escalerasT3{3}];
p_pantalon_e = anova1(pantalon_e,group,"off");
fprintf("P-value para pantalon escaleras: %f\n",p_pantalon_e);




