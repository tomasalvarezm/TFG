
%evalluamos todos los registros  y mostramos gráficamente el ECG  y el
%score  latido a latido
hold on
[t1,c1,s1]=pruebaDSQI("ECGRuido.txt");
plot(c1 *70000)

figure
hold on
[t2,c2,s2]=pruebaDSQI("ECGRuido2.txt");
plot(c2 *70000)

figure
hold on
[t3,c3,s3]=pruebaDSQI("ECGRuido3.txt");
plot(c3 *70000)

figure
hold on
[t4,c4,s4]=pruebaDSQI("ECGRuidoNormal.txt");
plot(c4 *70000)

figure
hold on
[t5,c5,s5]=pruebaDSQI("ECGNormal.txt");
plot(c5 *70000)


figure
hold on
[t6,c6,s6]=pruebaDSQI("Tela1_Escaleras.txt");
plot(c6 *70000)

figure
hold on
[t7,c7,s7]=pruebaDSQI("Tela2_Escaleras.txt");
plot(c7 *70000)

figure
hold on
[t8,c8,s8]=pruebaDSQI("ECGFlatLine.txt");
plot(c8 *70000)



% callculamos varios parámetros para ver  cuál representa mejor la calidad
disp("ECGRuido.txt");
 mean(mean(mean((s1))))
 nanmean(c1)
 t1
 disp("ECGRuido2.txt");
 mean(mean(mean((s2))))
 nanmean(c2)
 t2
 disp("ECGRuido3.txt");
 mean(mean(mean((s3))))
 nanmean(c3)
 t3
 disp("ECGRuidoNormal.txt");
 mean(mean(mean((s4))))
 nanmean(c4)
 t4
 disp("ECGNormal.txt");
 mean(mean(mean((s5))))
 nanmean(c5)
 t5 
 disp("Tela1_Escaleras.txt");
 mean(mean(mean((s6))))
 nanmean(c6)
 t6
 disp("Tela2_Escaleras.txt");
 mean(mean(mean((s7))))
 nanmean(c7)
 t7

 % haccemos el análisis en ventanas de longitud de un 10º de la duración
 % del registro
 %{
disp("ECGRuido.txt");
hold on
[t1,c1,s1]=pruebaDSQI2("ECGRuido.txt");
disp("ECGRuido2.txt");
figure
hold on
[t2,c2,s2]=pruebaDSQI2("ECGRuido2.txt");
disp("ECGRuido3.txt");
figure
hold on
[t3,c3,s3]=pruebaDSQI2("ECGRuido3.txt");
disp("ECGRuidoNormal.txt");
figure
hold on
disp("ECGNormal.txt");
[t4,c4,s4]=pruebaDSQI2("ECGRuidoNormal.txt");
figure
hold on
[t5,c5,s5]=pruebaDSQI2("ECGNormal.txt");
disp("Tela1_Escaleras.txt");
figure
hold on
[t6,c6,s6]=pruebaDSQI2("Tela1_Escaleras.txt");
disp("Tela2_Escaleras.txt");
figure
hold on
[t7,c7,s7]=pruebaDSQI2("Tela2_Escaleras.txt");
%}

