crear_archivo_n_lineas('Registro1_TopM_2023_10_19.txt', 400000)
crear_archivo_n_lineas('Registro2_TopM_2023-10-24_08-26-59.txt', 400000)



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