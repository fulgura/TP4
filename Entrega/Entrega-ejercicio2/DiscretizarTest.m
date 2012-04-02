clc
clear all

Datos = csvread('cancer.csv');

lchrom      = 9; 
popsize     = 70;           % tamanio de la poblacion 

CantCols = size(Datos, 2);
Clase = Datos(:, CantCols);
PopInter4 = Discretizar(Datos(:, 1:CantCols-1), 4);
PopInter7 = Discretizar(Datos(:, 1:CantCols-1), 7);

