
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

data_T2_camiseta = ImportPluxDataWithHeader('Test2.txt',4);
data_andando_T2_camiseta = data_T2_camiseta(1*60*1000+1:9*60*1000);
data_escaleras_T2_camiseta = data_T2_camiseta(11*60*1000+1:19*60*1000);
data_trabajando_T2_camiseta = data_T2_camiseta(21*60*1000+1:29*60*1000);

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

%registros trabajando 
T1_trabajando = {data_trabajando_T1_top,data_trabajando_T1_camiseta,data_trabajando_T1_pantalon};
n = length(T1_trabajando);
indexes_trabajandoT1 = cell(1,n);

for i=1:n
    data = T1_trabajando{i};
    [kSQI_01_vector,sSQI_01_vector, pSQI_01_vector,rel_powerLine01_vector, cSQI_01_vector, basSQI_01_vector,dSQI_01_vector,geometricMean_vector,averageGeometricMean] = mSQI(data, 1000);
    indexes_trabajandoT1{i} = geometricMean_vector;
end

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


%significance level for calculating the confidence intervals
alph = 0.01;
%number of iterations to use in boostrap
iter = 1000;

%USING MEDIAN

%top trabajando
CIMedian_topTrabajando_T1T2 = estimateCIMedian(indexes_trabajandoT1{1},indexes_trabajandoT2{1},alph,iter);
CIMedian_topTrabajando_T1T3 = estimateCIMedian(indexes_trabajandoT1{1},indexes_trabajandoT3{1},alph,iter);
CIMedian_topTrabajando_T2T3 = estimateCIMedian(indexes_trabajandoT2{1},indexes_trabajandoT3{1},alph,iter);

%top andando
CIMedian_topAndando_T1T2 = estimateCIMedian(indexes_andandoT1{1},indexes_andandoT2{1},alph,iter);
CIMedian_topAndando_T1T3 = estimateCIMedian(indexes_andandoT1{1},indexes_andandoT3{1},alph,iter);
CIMedian_topAndando_T2T3 = estimateCIMedian(indexes_andandoT2{1},indexes_andandoT3{1},alph,iter);
% 
% %top escaleras
CIMedian_topEscaleras_T1T2 = estimateCIMedian(indexes_escalerasT1{1},indexes_escalerasT2{1},alph,iter);
CIMedian_topEscaleras_T1T3 = estimateCIMedian(indexes_escalerasT1{1},indexes_escalerasT3{1},alph,iter);
CIMedian_topEscaleras_T2T3 = estimateCIMedian(indexes_escalerasT2{1},indexes_escalerasT3{1},alph,iter);
% 
%camiseta trabajando
CIMedian_camisetaTrabajando_T1T2 = estimateCIMedian(indexes_trabajandoT1{2},indexes_trabajandoT2{2},alph,iter);
CIMedian_camisetaTrabajando_T1T3 = estimateCIMedian(indexes_trabajandoT1{2},indexes_trabajandoT3{2},alph,iter);
CIMedian_camisetaTrabajando_T2T3 = estimateCIMedian(indexes_trabajandoT2{2},indexes_trabajandoT3{2},alph,iter);

%camiseta andando
CIMedian_camisetaAndando_T1T2 = estimateCIMedian(indexes_andandoT1{2},indexes_andandoT2{2},alph,iter);
CIMedian_camisetaAndando_T1T3 = estimateCIMedian(indexes_andandoT1{2},indexes_andandoT3{2},alph,iter);
CIMedian_camisetaAndando_T2T3 = estimateCIMedian(indexes_andandoT2{2},indexes_andandoT3{2},alph,iter);

%camiseta escaleras
CIMedian_camisetaEscaleras_T1T2 = estimateCIMedian(indexes_escalerasT1{2},indexes_escalerasT2{2},alph,iter);
CIMedian_camisetaEscaleras_T1T3 = estimateCIMedian(indexes_escalerasT1{2},indexes_escalerasT3{2},alph,iter);
CIMedian_camisetaEscaleras_T2T3 = estimateCIMedian(indexes_escalerasT2{2},indexes_escalerasT3{2},alph,iter);

%pantalon trabajando
CIMedian_pantTrabajando_T1T2 = estimateCIMedian(indexes_trabajandoT1{3},indexes_trabajandoT2{3},alph,iter);
CIMedian_pantTrabajando_T1T3 = estimateCIMedian(indexes_trabajandoT1{3},indexes_trabajandoT3{3},alph,iter);
CIMedian_pantTrabajando_T2T3 = estimateCIMedian(indexes_trabajandoT2{3},indexes_trabajandoT3{3},alph,iter);

%pantalon andando
CIMedian_pantAndando_T1T2 = estimateCIMedian(indexes_andandoT1{3},indexes_andandoT2{3},alph,iter);
CIMedian_pantAndando_T1T3 = estimateCIMedian(indexes_andandoT1{3},indexes_andandoT3{3},alph,iter);
CIMedian_pantAndando_T2T3 = estimateCIMedian(indexes_andandoT2{3},indexes_andandoT3{3},alph,iter);

%pantalon escaleras
CIMedian_pantEscaleras_T1T2 = estimateCIMedian(indexes_escalerasT1{3},indexes_escalerasT2{3},alph,iter);
CIMedian_pantEscaleras_T1T3 = estimateCIMedian(indexes_escalerasT1{3},indexes_escalerasT3{3},alph,iter);
CIMedian_pantEscaleras_T2T3 = estimateCIMedian(indexes_escalerasT2{3},indexes_escalerasT3{3},alph,iter);

% %USING MEAN 

%top trabajando
CIMean_topTrabajando_T1T2 = estimateCIMean(indexes_trabajandoT1{1},indexes_trabajandoT2{1},alph,iter);
CIMean_topTrabajando_T1T3 = estimateCIMean(indexes_trabajandoT1{1},indexes_trabajandoT3{1},alph,iter);
CIMean_topTrabajando_T2T3 = estimateCIMean(indexes_trabajandoT2{1},indexes_trabajandoT3{1},alph,iter);

%top andando
CIMean_topAndando_T1T2 = estimateCIMean(indexes_andandoT1{1},indexes_andandoT2{1},alph,iter);
CIMean_topAndando_T1T3 = estimateCIMean(indexes_andandoT1{1},indexes_andandoT3{1},alph,iter);
CIMean_topAndando_T2T3 = estimateCIMean(indexes_andandoT2{1},indexes_andandoT3{1},alph,iter);
% 
% %top escaleras
CIMean_topEscaleras_T1T2 = estimateCIMean(indexes_escalerasT1{1},indexes_escalerasT2{1},alph,iter);
CIMean_topEscaleras_T1T3 = estimateCIMean(indexes_escalerasT1{1},indexes_escalerasT3{1},alph,iter);
CIMean_topEscaleras_T2T3 = estimateCIMean(indexes_escalerasT2{1},indexes_escalerasT3{1},alph,iter);
% 
%camiseta trabajando
CIMean_camisetaTrabajando_T1T2 = estimateCIMean(indexes_trabajandoT1{2},indexes_trabajandoT2{2},alph,iter);
CIMean_camisetaTrabajando_T1T3 = estimateCIMean(indexes_trabajandoT1{2},indexes_trabajandoT3{2},alph,iter);
CIMean_camisetaTrabajando_T2T3 = estimateCIMean(indexes_trabajandoT2{2},indexes_trabajandoT3{2},alph,iter);

%camiseta andando
CIMean_camisetaAndando_T1T2 = estimateCIMean(indexes_andandoT1{2},indexes_andandoT2{2},alph,iter);
CIMean_camisetaAndando_T1T3 = estimateCIMean(indexes_andandoT1{2},indexes_andandoT3{2},alph,iter);
CIMean_camisetaAndando_T2T3 = estimateCIMean(indexes_andandoT2{2},indexes_andandoT3{2},alph,iter);

%camiseta escaleras
CIMean_camisetaEscaleras_T1T2 = estimateCIMean(indexes_escalerasT1{2},indexes_escalerasT2{2},alph,iter);
CIMean_camisetaEscaleras_T1T3 = estimateCIMean(indexes_escalerasT1{2},indexes_escalerasT3{2},alph,iter);
CIMean_camisetaEscaleras_T2T3 = estimateCIMean(indexes_escalerasT2{2},indexes_escalerasT3{2},alph,iter);

%pantalon trabajando
CIMean_pantTrabajando_T1T2 = estimateCIMean(indexes_trabajandoT1{3},indexes_trabajandoT2{3},alph,iter);
CIMean_pantTrabajando_T1T3 = estimateCIMean(indexes_trabajandoT1{3},indexes_trabajandoT3{3},alph,iter);
CIMean_pantTrabajando_T2T3 = estimateCIMean(indexes_trabajandoT2{3},indexes_trabajandoT3{3},alph,iter);

%pantalon andando
CIMean_pantAndando_T1T2 = estimateCIMean(indexes_andandoT1{3},indexes_andandoT2{3},alph,iter);
CIMean_pantAndando_T1T3 = estimateCIMean(indexes_andandoT1{3},indexes_andandoT3{3},alph,iter);
CIMean_pantAndando_T2T3 = estimateCIMean(indexes_andandoT2{3},indexes_andandoT3{3},alph,iter);

%pantalon escaleras
CIMean_pantEscaleras_T1T2 = estimateCIMean(indexes_escalerasT1{3},indexes_escalerasT2{3},alph,iter);
CIMean_pantEscaleras_T1T3 = estimateCIMean(indexes_escalerasT1{3},indexes_escalerasT3{3},alph,iter);
CIMean_pantEscaleras_T2T3 = estimateCIMean(indexes_escalerasT2{3},indexes_escalerasT3{3},alph,iter);

%top 
top_andando = [indexes_andandoT1{1},indexes_andandoT2{1},indexes_andandoT3{1}];
top_escaleras = [indexes_escalerasT1{1},indexes_escalerasT2{1},indexes_escalerasT3{1}];
top_trabajando = [indexes_trabajandoT1{1},indexes_trabajandoT2{1},indexes_trabajandoT3{1}];
top = [indexes_andandoT1{1},indexes_andandoT2{1},indexes_andandoT3{1},indexes_escalerasT1{1},indexes_escalerasT2{1},indexes_escalerasT3{1},indexes_trabajandoT1{1},indexes_trabajandoT2{1},indexes_trabajandoT3{1}];

CIMedian_topAndEsc = estimateCIMedian(top_andando,top_escaleras,alph,iter);
CIMedian_topAndTrab = estimateCIMedian(top_andando,top_trabajando,alph,iter);
CIMedian_topEscTrab = estimateCIMedian(top_escaleras,top_trabajando,alph,iter);

CIMean_topAndEsc = estimateCIMean(top_andando,top_escaleras,alph,iter);
CIMean_topAndTrab = estimateCIMean(top_andando,top_trabajando,alph,iter);
CIMean_topEscTrab = estimateCIMean(top_escaleras,top_trabajando,alph,iter);

%camiseta
camiseta_andando = [indexes_andandoT1{2},indexes_andandoT2{2},indexes_andandoT3{2}];
camiseta_escaleras = [indexes_escalerasT1{2},indexes_escalerasT2{2},indexes_escalerasT3{2}];
camiseta_trabajando = [indexes_trabajandoT1{2},indexes_trabajandoT2{2},indexes_trabajandoT3{2}];
camiseta = [indexes_andandoT1{2},indexes_andandoT2{2},indexes_andandoT3{2},indexes_escalerasT1{2},indexes_escalerasT2{2},indexes_escalerasT3{2},indexes_trabajandoT1{2},indexes_trabajandoT2{2},indexes_trabajandoT3{2}];

CIMedian_camAndEsc = estimateCIMedian(camiseta_andando,camiseta_escaleras,alph,iter);
CIMedian_camAndTrab = estimateCIMedian(camiseta_andando,camiseta_trabajando,alph,iter);
CIMedian_camEscTrab = estimateCIMedian(camiseta_escaleras,camiseta_trabajando,alph,iter);

CIMean_camAndEsc = estimateCIMean(camiseta_andando,camiseta_escaleras,alph,iter);
CIMean_camAndTrab = estimateCIMean(camiseta_andando,camiseta_trabajando,alph,iter);
CIMean_camEscTrab = estimateCIMean(camiseta_escaleras,camiseta_trabajando,alph,iter);

%pantalon
pant_andando = [indexes_andandoT1{3},indexes_andandoT2{3},indexes_andandoT3{3}];
pant_escaleras = [indexes_escalerasT1{3},indexes_escalerasT2{3},indexes_escalerasT3{3}];
pant_trabajando = [indexes_trabajandoT1{3},indexes_trabajandoT2{3},indexes_trabajandoT3{3}];
pantalon = [indexes_andandoT1{3},indexes_andandoT2{3},indexes_andandoT3{3},indexes_escalerasT1{3},indexes_escalerasT2{3},indexes_escalerasT3{3},indexes_trabajandoT1{3},indexes_trabajandoT2{3},indexes_trabajandoT3{3}];

CIMedian_pantAndEsc = estimateCIMedian(pant_andando,pant_escaleras,alph,iter);
CIMedian_pantAndTrab = estimateCIMedian(pant_andando,pant_trabajando,alph,iter);
CIMedian_pantEscTrab = estimateCIMedian(pant_escaleras,pant_trabajando,alph,iter);

CIMean_pantAndEsc = estimateCIMean(pant_andando,pant_escaleras,alph,iter);
CIMean_pantAndTrab = estimateCIMean(pant_andando,pant_trabajando,alph,iter);
CIMean_pantEscTrab = estimateCIMean(pant_escaleras,pant_trabajando,alph,iter);

%top vs camiseta para diferentes actividades 
CIMedian_topcamAnd = estimateCIMedian(top_andando,camiseta_andando,alph,iter);
CIMedian_topcamEsc = estimateCIMedian(top_escaleras,camiseta_escaleras,alph,iter);
CIMedian_topcamTrab = estimateCIMedian(top_trabajando,camiseta_trabajando,alph,iter);

CIMean_topcamAnd = estimateCIMean(top_andando,camiseta_andando,alph,iter);
CIMean_topcamEsc = estimateCIMean(top_escaleras,camiseta_escaleras,alph,iter);
CIMean_topcamTrab = estimateCIMean(top_trabajando,camiseta_trabajando,alph,iter);

%top vs pantalon para diferentes actividades 
CIMedian_toppantAnd = estimateCIMedian(top_andando,pant_andando,alph,iter);
CIMedian_toppantEsc = estimateCIMedian(top_escaleras,pant_escaleras,alph,iter);
CIMedian_toppantTrab = estimateCIMedian(top_trabajando,pant_trabajando,alph,iter);

CIMean_toppantAnd = estimateCIMean(top_andando,pant_andando,alph,iter);
CIMean_toppantEsc = estimateCIMean(top_escaleras,pant_escaleras,alph,iter);
CIMean_toppantTrab = estimateCIMean(top_trabajando,pant_trabajando,alph,iter);

%camiseta vs pantalon para diferentes actividades 
CIMedian_campantAnd = estimateCIMedian(camiseta_andando,pant_andando,alph,iter);
CIMedian_campantEsc = estimateCIMedian(camiseta_escaleras,pant_escaleras,alph,iter);
CIMedian_campantTrab = estimateCIMedian(camiseta_trabajando,pant_trabajando,alph,iter);

CIMean_campantAnd = estimateCIMean(camiseta_andando,pant_andando,alph,iter);
CIMean_campantEsc = estimateCIMean(camiseta_escaleras,pant_escaleras,alph,iter);
CIMean_campantTrab = estimateCIMean(camiseta_trabajando,pant_trabajando,alph,iter);

%top vs camiseta para todas las actividades y tests 
CIMedian_topcam = estimateCIMedian(top,camiseta,alph,iter);
CIMean_topcam = estimateCIMean(top,camiseta,alph,iter);

%top vs pantalon para todas las actividades y tests
CIMedian_toppant = estimateCIMedian(top,pantalon,alph,iter);
CIMean_toppant = estimateCIMean(top,pantalon,alph,iter);

%camiseta vs pantalon para todas las actividades y tests 
CIMedian_campant = estimateCIMedian(camiseta,pantalon,alph,iter);
CIMean_campant = estimateCIMean(camiseta,pantalon,alph,iter);


