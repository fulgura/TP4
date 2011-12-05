function [ Pop ] = GenerarPoblacion( lchrom, popsize)
%GENERARPOBLACION Summary of this function goes here
%   Detailed explanation goes here

Pop = zeros(lchrom, popsize);

%% Modificamos la primer columna llamada Practica
Pop(1,:) = round(3*rand(1, popsize));
% Segunda columna = Activ-Distancia
Pop(2,:) = round(2*rand(1, popsize));
% Tercera columna 3 = Activ-Presencial
Pop(3,:) = round(2*rand(1, popsize));

end

