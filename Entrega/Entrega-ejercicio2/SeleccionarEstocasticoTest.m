%%
clc
clear all

Datos = csvread('cancer.csv');
lchrom  = 9;            % long. del cromosoma 
popsize = 70;           % tama?o de la poblacion 
pcross  = 0.65;         % probabilidad de crossover
pmutation = 0.05;       % probabilidad de mutacion
maxgen   = 100;        % m?x. cant.de generaciones
numintervalos = 4;
NroClase = 2;
variables = size(Datos, 2);

CantCols = size(Datos, 2);
Clase = Datos(:, CantCols);
Datos = Discretizar(Datos(:, 1:CantCols-1), numintervalos);
prob = 0.7;

% 1. Genero la poblacion con valores random. una matriz de 20x3 = popsizexlchrom
Pop = GenerarPoblacion(popsize, lchrom);
Pop = Discretizar(Pop, numintervalos);

limites = [zeros(variables,1) 4*ones(variables,1)];

% 2. Valido que las reglas sean validas, si no es asi las corrijo
Pop = ReglasValidadas(Pop, limites);

% 3. Calculo medida aptitud, como el promedio entre el soporte y confianza.
% Puedo agregar la ponderacion por la longitud de la regla
[Soporte, Confianza, Aptitud] = Fitness(Datos, Pop, Clase, NroClase);

Aptitud




