function [ Pop ] = GenerarPoblacion( lchrom, popsize)
%GENERARPOBLACION Crea una poblaci?n aleatoria 
%                 utilizando una codifiaci?n entera de longitud fija.
%
%   Representaci?n de cada una de las variables:
%
%       Practica         = {no-aplica = 0, regular = 1, bien = 2, muy_bien =  3}
%       Activ-Distancia  = {no-aplica = 0, baja = 1, alta = 2}
%       Activ-Presencial = {no-aplica = 0, baja = 1, alta = 2}
%

Pop = zeros(lchrom, popsize);

%% Modificamos la primer columna llamada Practica
Pop(1,:) = round(3*rand(1, popsize));
% Segunda columna = Activ-Distancia
Pop(2,:) = round(2*rand(1, popsize));
% Tercera columna 3 = Activ-Presencial
Pop(3,:) = round(2*rand(1, popsize));

end

