
clc;
clear all;

%% Seccion para la definicion de la variables 

lchrom  = 3 ;           % long. del cromosoma
popsize = 10;           % tamanio de la poblacion
pcross  = 1;            % probabilidad de crossover
pmutation = 0;          % probabilidad de mutacion
maxgen   = 500;         % max. cant.de generaciones
NroClase = 1;           % Clase a procesar

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
Pop = GenerarPoblacion(lchrom, popsize)


%% Evaluamos las reglas donde el consecuente es aprobado.
% calculo el soporte y la confianza para cada reglas

Soporte = CalcularSoporte(Datos, Pop); %sobre aprobados

Confianza = CalcularConfianza(Datos, Pop, NroClase);

% Medida de aptitud : promedio entre el soporte y la confianza
Fitness = (Soporte + Confianza) ./2

%% Iteraciones 

for ite = 1 : 3
    
    
    [OrdenFitness Indices] = sort(Fitness, 2, 'descend');
    
    %% Elegimos las dos mejores reglas
    regla1 = Pop(:, Indices(1))
    regla2 = Pop(:, Indices(2))
    
    
    %% Elegimos las dos peores
        % 5. Elijo las 2 peores reglas
    peor1 = Pop(:, Indices(popsize))
    peor2 = Pop(:, Indices(popsize - 1))
    
end




