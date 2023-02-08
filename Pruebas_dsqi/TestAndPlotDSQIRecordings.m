
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



% callculamos varios parámetros para ver  cuál representa mejor la calidad
 mean(mean(mean((s1))))
 nanmean(c1)
 t1
 mean(mean(mean((s2))))
 nanmean(c2)
 t2
 mean(mean(mean((s3))))
 nanmean(c3)
 t3
 mean(mean(mean((s4))))
 nanmean(c4)
 t4
 mean(mean(mean((s5))))
 nanmean(c5)
 t5 
 mean(mean(mean((s6))))
 nanmean(c6)
 t6
 mean(mean(mean((s7))))
 nanmean(c7)
 t7

 % haccemos el análisis en ventanas de longitud de un 10º de la duración
 % del registro

[t1,c1,s1]=pruebaDSQI2("ECGRuido.txt");
[t2,c2,s2]=pruebaDSQI("ECGRuido2.txt");
[t3,c3,s3]=pruebaDSQI("ECGRuido3.txt");
[t4,c4,s4]=pruebaDSQI("ECGRuidoNormal.txt");
[t5,c5,s5]=pruebaDSQI("ECGNormal.txt");
[t6,c6,s6]=pruebaDSQI("Tela1_Escaleras.txt");
[t7,c7,s7]=pruebaDSQI("Tela2_Escaleras.txt");[t1,c1,s1]=pruebaDSQI("ECGRuido.txt");

