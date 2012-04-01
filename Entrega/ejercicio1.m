
clc;
clear all;

%% Seccion para la definicion de la variables

lchrom  = 3 ;           % long. del cromosoma
popsize = 10;           % tamanio de la poblacion
pcross  = 1;            % probabilidad de crossover
pmutation = 0;          % probabilidad de mutacion
maxgen   = 500;         % max. cant.de generaciones
NroClase = 1;           % Clase a procesar
filename = 'Ejercicio1.csv'; % Archivo con los resultados obtenidos.
separador = [NaN NaN NaN]'; % Separador utilizado para imprimir datos

%% Generacion de los datos originales
%Matriz de datos codificada en numerico de longitud fija

Datos = [2,2,2,1; % bien,       alta,   alta,   aprobado
    2,1,2,0;      % bien,       baja,   alta,   desaprobado
    3,2,2,1;      % muy_bien,   alta,   alta,   aprobado
    1,2,2,1;
    1,2,1,0;
    1,1,1,0;
    3,1,1,1;
    2,1,1,0;
    2,2,1,1;
    1,1,1,0;
    2,2,1,1;
    3,2,2,1;
    1,1,1,0;
    1,2,2,1];


%% Generamos una problacion valida
Pop = GenerarPoblacion(lchrom, popsize);
dlmwrite(filename ,Pop,'delimiter','\t');

%% Evaluamos las reglas donde el consecuente es aprobado.
% calculo el soporte y la confianza para cada reglas
% Medida de aptitud : promedio entre el soporte y la confianza
[Soporte, Confianza, Aptitud] = Fitness(Datos(:,1:3), Pop, Datos(:,4), NroClase);


dlmwrite(filename ,Soporte, 'delimiter', '\t', '-append');
dlmwrite(filename ,Confianza, 'delimiter', '\t', '-append');
dlmwrite(filename ,Aptitud, 'delimiter', '\t', '-append');


%% Iteraciones

for ite = 1 : 3
    
    [OrdenFitness Indices] = sort(Aptitud, 2, 'descend');
    
    %% Elegimos las dos mejores reglas
    primerPos = Indices(1);
    segundaPos = Indices(2);
    
    mejorRegla1 = Pop(:, primerPos);
    mejorRegla2 = Pop(:, segundaPos);
    
    
    [h1, h2] = CruzarMutar(Pop, ...
        Indices(1), ...
        Indices(2), ...
        pcross, ...
        pmutation);
    
    %% Elegimos las dos peores reglas
    ultimaPos = Indices(popsize);
    anteultimaPos = Indices(popsize - 1);
    
    peorRegla1 = Pop(:, ultimaPos);
    peorRegla2 = Pop(:, anteultimaPos);
    
    
    %% Reemplazamos en la problacion los nuevos valores
    Pop(:, ultimaPos) = h1;
    Pop(:, anteultimaPos) = h2;
    % Actualizamos la salida con la nueva poblacion
    
    [Soporte, Confianza, Aptitud] = Fitness(Datos(:,1:3), Pop, Datos(:,4), NroClase);
    
    dlmwrite(filename , [ [NaN ite NaN]' ...
        mejorRegla1 mejorRegla2 ...
        separador ...
        h1 h2...
        separador ...
        separador ...
        peorRegla1 peorRegla2], ...
        'delimiter', ...
        '\t', ...
        '-append');
    
    dlmwrite(filename ,Pop, 'delimiter', '\t', '-append');
    dlmwrite(filename ,Soporte, 'delimiter', '\t', '-append');
    dlmwrite(filename ,Confianza, 'delimiter', '\t', '-append');
    dlmwrite(filename ,Aptitud, 'delimiter', '\t', '-append');
    
    
end




