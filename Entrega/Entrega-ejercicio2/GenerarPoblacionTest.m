clc
clear all

Datos = csvread('cancer.csv');

lchrom      = 9; 
popsize     = 70;           % tamanio de la poblacion 

Pop = GenerarPoblacion( lchrom, popsize);
Pop = Pop'