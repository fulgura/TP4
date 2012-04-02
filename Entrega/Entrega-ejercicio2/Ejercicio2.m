clc
clear all

delete('historia.csv');
delete('resultado.csv');

Datos = csvread('cancer.csv');


lchrom  = 9;            % long. del cromosoma 
popsize = 70;           % tamanio de la poblacion 
pcross  = 0.65;         % probabilidad de crossover
pmutation = 0.05;       % probabilidad de mutacion
maxgen   = 100;        % m?x. cant.de generaciones


