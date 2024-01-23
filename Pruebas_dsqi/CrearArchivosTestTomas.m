
% files Shirt L
crear_archivo_n_lineas('L_Day1_2024_1_8.txt', 1000000)
crear_archivo_n_lineas('L_Day2_2024_1_12.txt', 1000000)
crear_archivo_n_lineas('L_Day3_2024_1_16.txt', 1000000)
crear_archivo_n_lineas('L_Day4_2024_1_20.txt', 1000000) 
                        

% files Shirt M
crear_archivo_n_lineas('M_Day1_2023_12_28.txt', 1000000)
crear_archivo_n_lineas('M_Day2_2024_1_10.txt', 1000000)
crear_archivo_n_lineas('M_Day3_2024_1_15.txt', 1000000)
crear_archivo_n_lineas('M_Day4_2024_1_18.txt', 1000000)

% files Shirt S
 crear_archivo_n_lineas('S_Day1_2023_12_26.txt', 1000000)
 crear_archivo_n_lineas('S_Day2_2024_1_9.txt', 1000000)
 crear_archivo_n_lineas('S_Day3_2024_1_14.txt', 1000000)
 crear_archivo_n_lineas('S_Day4_2024_1_17.txt', 1000000)

function [archivo_nuevo] = crear_archivo_n_lineas(archivo_original, n)

% Abre el archivo original en modo de lectura
fid = fopen(archivo_original, 'r');


% Crea un nuevo archivo con el nombre especificado
archivo_nuevo = fopen("n_"+archivo_original, 'w');

% Lee las primeras n líneas del archivo original
for i = 1:n
    % Lee una línea del archivo original
    linea = fgetl(fid);

    % Añade la línea al vector
    if linea ~= -1     
    % Escribe las primeras n líneas del archivo original en el nuevo archivo
    fprintf(archivo_nuevo, '%s\n', linea);
    end
end

% Cierra el archivo original
fclose(fid);


% Cierra el nuevo archivo
fclose(archivo_nuevo);
end