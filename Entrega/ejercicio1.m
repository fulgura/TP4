
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

Soporte = CalcularSoporte(Datos, Pop); %sobre aprobados
dlmwrite(filename ,Soporte, 'delimiter', '\t', '-append');

Confianza = CalcularConfianza(Datos, Pop, NroClase);
dlmwrite(filename ,Confianza, 'delimiter', '\t', '-append');

% Medida de aptitud : promedio entre el soporte y la confianza
Fitness = (Soporte + Confianza) ./2;
dlmwrite(filename ,Fitness, 'delimiter', '\t', '-append');


%% Iteraciones

for ite = 1 : 3
    
    ite
    [OrdenFitness Indices] = sort(Fitness, 2, 'descend');
    
    %% Elegimos las dos mejores reglas
    primerPos = Indices(1);
    segundaPos = Indices(2);
    
    mejorRegla1 = Pop(:, primerPos);
    mejorRegla2 = Pop(:, segundaPos);
    
    mejorRegla1'
    mejorRegla2'
    
    
    [h1, h2] = CruzarMutar(Pop, Indices(1), Indices(2), pcross, pmutation);
    
    h1'
    h2'
    
    %% Elegimos las dos peores reglas
    ultimaPos = Indices(popsize);
    anteultimaPos = Indices(popsize - 1);
    
    peorRegla1 = Pop(:, ultimaPos);
    peorRegla2 = Pop(:, anteultimaPos);
    
    %% Reemplazamos en la problacion los nuevos valores
    Pop(:, ultimaPos) = h1;
    Pop(:, anteultimaPos) = h2;
    % Actualizamos la salida con la nueva poblacion
    dlmwrite(filename ,Pop, 'delimiter', '\t', '-append');
    
    %% Evaluamos las reglas donde el consecuente es aprobado.
    % calculo el soporte y la confianza para cada reglas
    
    Soporte = CalcularSoporte(Datos, Pop); %sobre aprobados
    dlmwrite(filename ,Soporte, 'delimiter', '\t', '-append');
    
    Confianza = CalcularConfianza(Datos, Pop, NroClase);
    dlmwrite(filename ,Confianza, 'delimiter', '\t', '-append');
    %% Medida de aptitud : promedio entre el soporte y la confianza
    Fitness = (Soporte + Confianza) ./2;
    dlmwrite(filename ,Fitness, 'delimiter', '\t', '-append');
    %% Validar reglas ??
    
    
    dlmwrite(filename ,'', 'delimiter', '\t', '-append');
end




