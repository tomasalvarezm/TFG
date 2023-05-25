

%Tela 1 sin gel 
files = {'Tela1-SG/Tela1_hora0_andando_SinGel.txt','Tela1-SG/Tela1_hora0_escaleras_SinGel.txt','Tela1-SG/Tela1_hora0_trabajando_SinGel.txt','Tela1-SG/Tela1_hora1_andando_SinGel.txt','Tela1-SG/Tela1_hora1_escaleras_SinGel.txt','Tela1-SG/Tela1_hora1_trabajando_SinGel.txt','Tela1-SG/Tela1_hora2_andando_SinGel.txt','Tela1-SG/Tela1_hora2_escaleras_SinGel.txt','Tela1-SG/Tela1_hora2_trabajando_SinGel.txt','Tela1-SG/Tela1_hora3_andando_SinGel.txt','Tela1-SG/Tela1_hora3_escaleras_SinGel.txt','Tela1-SG/Tela1_hora3_trabajando_SinGel.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end

% %Tela 2 sin gel 
files = {'Tela2-SG/Tela2_hora0_andando_SinGel.txt','Tela2-SG/Tela2_hora0_escaleras_SinGel.txt','Tela2-SG/Tela2_hora0_trabajando_SinGel.txt','Tela2-SG/Tela2_hora1_andando_SinGel.txt','Tela2-SG/Tela2_hora1_escaleras_SinGel.txt','Tela2-SG/Tela2_hora1_trabajando_SinGel.txt','Tela2-SG/Tela2_hora2_andando_SinGel.txt','Tela2-SG/Tela2_hora2_escaleras_SinGel.txt','Tela2-SG/Tela2_hora2_trabajando_SinGel.txt','Tela2-SG/Tela2_hora3_andando_SinGel.txt','Tela2-SG/Tela2_hora3_escaleras_SinGel.txt','Tela2-SG/Tela2_hora3_trabajando_SinGel.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end
% 
% %Tela 3 sin gel 
files = {'Tela3-SG/Tela3_hora0_andando_SinGel.txt','Tela3-SG/Tela3_hora0_escaleras_SinGel.txt','Tela3-SG/Tela3_hora0_trabajando_SinGel.txt','Tela3-SG/Tela3_hora1_andando_SinGel.txt','Tela3-SG/Tela3_hora1_escaleras_SinGel.txt','Tela3-SG/Tela3_hora1_trabajando_SinGel.txt','Tela3-SG/Tela3_hora2_andando_SinGel.txt','Tela3-SG/Tela3_hora2_escaleras_SinGel.txt','Tela3-SG/Tela3_hora2_trabajando_SinGel.txt','Tela3-SG/Tela3_hora3_andando_SinGel.txt','Tela3-SG/Tela3_hora3_escaleras_SinGel.txt','Tela3-SG/Tela3_hora3_trabajando_SinGel.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end
% 
% %Tela 1 con gel 
files = {'Tela1-CG/Tela1_hora0_andando_ConGel.txt','Tela1-CG/Tela1_hora0_escaleras_ConGel.txt','Tela1-CG/Tela1_hora0_trabajando_ConGel.txt','Tela1-CG/Tela1_hora1_andando_ConGel.txt','Tela1-CG/Tela1_hora1_escaleras_ConGel.txt','Tela1-CG/Tela1_hora1_trabajando_ConGel.txt','Tela1-CG/Tela1_hora2_andando_ConGel.txt','Tela1-CG/Tela1_hora2_escaleras_ConGel.txt','Tela1-CG/Tela1_hora2_trabajando_ConGel.txt','Tela1-CG/Tela1_hora3_andando_ConGel.txt','Tela1-CG/Tela1_hora3_escaleras_ConGel.txt','Tela1-CG/Tela1_hora3_trabajando_ConGel.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end
% 
% %Tela 2 con gel 
files = {'Tela2-CG/Tela2_hora0_andando_ConGel.txt','Tela2-CG/Tela2_hora0_escaleras_ConGel.txt','Tela2-CG/Tela2_hora0_trabajando_ConGel.txt','Tela2-CG/Tela2_hora1_andando_ConGel.txt','Tela2-CG/Tela2_hora1_escaleras_ConGel.txt','Tela2-CG/Tela2_hora1_trabajando_ConGel.txt','Tela2-CG/Tela2_hora2_andando_ConGel.txt','Tela2-CG/Tela2_hora2_escaleras_ConGel.txt','Tela2-CG/Tela2_hora2_trabajando_ConGel.txt','Tela2-CG/Tela2_hora3_andando_ConGel.txt','Tela2-CG/Tela2_hora3_escaleras_ConGel.txt','Tela2-CG/Tela2_hora3_trabajando_ConGel.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end
% 
% %Tela 3 con gel 
files = {'Tela3-CG/Tela3_hora0_andando_ConGel.txt','Tela3-CG/Tela3_hora0_escaleras_ConGel.txt','Tela3-CG/Tela3_hora0_trabajando_ConGel.txt','Tela3-CG/Tela3_hora1_andando_ConGel.txt','Tela3-CG/Tela3_hora1_escaleras_ConGel.txt','Tela3-CG/Tela3_hora1_trabajando_ConGel.txt','Tela3-CG/Tela3_hora2_andando_ConGel.txt','Tela3-CG/Tela3_hora2_escaleras_ConGel.txt','Tela3-CG/Tela3_hora2_trabajando_ConGel.txt','Tela3-CG/Tela3_hora3_andando_ConGel.txt','Tela3-CG/Tela3_hora3_escaleras_ConGel.txt','Tela3-CG/Tela3_hora3_trabajando_ConGel.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end
% 
% 
% %Tela 1 lavado sin gel 
files = {'Tela1_lavado_SG/Tela1_lavado_hora0_andando_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora0_escaleras_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora0_trabajando_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora1_andando_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora1_escaleras_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora1_trabajando_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora2_andando_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora2_escaleras_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora2_trabajando_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora3_andando_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora3_escaleras_SinGel.txt','Tela1_lavado_SG/Tela1_lavado_hora3_trabajando_SinGel.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end
% 
% %Tela 2 lavado sin gel 
files = {'Tela2_lavado_SG/Tela2_lavado_hora0_andando_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora0_escaleras_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora0_trabajando_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora1_andando_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora1_escaleras_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora1_trabajando_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora2_andando_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora2_escaleras_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora2_trabajando_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora3_andando_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora3_escaleras_SinGel.txt','Tela2_lavado_SG/Tela2_lavado_hora3_trabajando_SinGel.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end
% 
% %Tela 3 lavado sin gel 
files = {'Tela3_lavado_SG/Tela3_lavado_hora0_andando_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora0_escaleras_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora0_trabajando_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora1_andando_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora1_escaleras_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora1_trabajando_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora2_andando_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora2_escaleras_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora2_trabajando_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora3_andando_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora3_escaleras_SinGel.txt','Tela3_lavado_SG/Tela3_lavado_hora3_trabajando_SinGel.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end

%Tela 1 lavado con gel 
files = {'Tela1_lavado_CG/T1_lavado_H0_andando_CG.txt','Tela1_lavado_CG/T1_lavado_H0_escaleras_CG.txt','Tela1_lavado_CG/T1_lavado_H0_trabajando_CG.txt','Tela1_lavado_CG/T1_lavado_H1_andando_CG.txt','Tela1_lavado_CG/T1_lavado_H1_escaleras_CG.txt','Tela1_lavado_CG/T1_lavado_H1_trabajando_CG.txt','Tela1_lavado_CG/T1_lavado_H2_andando_CG.txt','Tela1_lavado_CG/T1_lavado_H2_escaleras_CG.txt','Tela1_lavado_CG/T1_lavado_H2_trabajando_CG.txt','Tela1_lavado_CG/T1_lavado_H3_andando_CG.txt','Tela1_lavado_CG/T1_lavado_H3_escaleras_CG.txt','Tela1_lavado_CG/T1_lavado_H3_trabajando_CG.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end

%Tela 2 lavado con gel 
files = {'Tela2_lavado_CG/T2_lavado_H0_andando_CG.txt','Tela2_lavado_CG/T2_lavado_H0_escaleras_CG.txt','Tela2_lavado_CG/T2_lavado_H0_trabajando_CG.txt','Tela2_lavado_CG/T2_lavado_H1_andando_CG.txt','Tela2_lavado_CG/T2_lavado_H1_escaleras_CG.txt','Tela2_lavado_CG/T2_lavado_H1_trabajando_CG.txt','Tela2_lavado_CG/T2_lavado_H2_andando_CG.txt','Tela2_lavado_CG/T2_lavado_H2_escaleras_CG.txt','Tela2_lavado_CG/T2_lavado_H2_trabajando_CG.txt','Tela2_lavado_CG/T2_lavado_H3_andando_CG.txt','Tela2_lavado_CG/T2_lavado_H3_escaleras_CG.txt','Tela2_lavado_CG/T2_lavado_H3_trabajando_CG.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end

%Tela 3 lavado con gel 
files = {'Tela3_lavado_CG/T3_lavado_H0_andando_CG.txt','Tela3_lavado_CG/T3_lavado_H0_escaleras_CG.txt','Tela3_lavado_CG/T3_lavado_H0_trabajando_CG.txt','Tela3_lavado_CG/T3_lavado_H1_andando_CG.txt','Tela3_lavado_CG/T3_lavado_H1_escaleras_CG.txt','Tela3_lavado_CG/T3_lavado_H1_trabajando_CG.txt','Tela3_lavado_CG/T3_lavado_H2_andando_CG.txt','Tela3_lavado_CG/T3_lavado_H2_escaleras_CG.txt','Tela3_lavado_CG/T3_lavado_H2_trabajando_CG.txt','Tela3_lavado_CG/T3_lavado_H3_andando_CG.txt','Tela3_lavado_CG/T3_lavado_H3_escaleras_CG.txt','Tela3_lavado_CG/T3_lavado_H3_trabajando_CG.txt'};
for i = 1:length(files) 
     file = files{i} ;
     [filepath,name,ext] = fileparts(file);
     [kSQI_01_v,sSQI_01_v, pSQI_01_v, SQI_rel_powerLine_01_v,cSQI_01_v, basSQI_01_v,dSQI_01_v,geometricMean_V,averageGeometricMean] = IndexForSignalWindows(ImportBitalinoData(file), originalFSBitalino);
     fprintf("Indexes for %s :  averageGeometricMean: %f \n ",file,averageGeometricMean);
end
