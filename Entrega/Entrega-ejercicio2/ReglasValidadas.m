function[P] = ReglasValidadas(P, Limites)
%% REGLASVALIDADAS: Validaciones de las reglas en la matriz P para la
% correcion de los limites de cadad variable. 
% Si una de las variables se fue del rango de sus limites definidos, se
% corrige tomando el valor maximo o minimo segun corresponda. 

P = ReglasNoNulas(P, Limites);

[CantRows, CantCols] = size(P);

% Chequeo de limites para cada uno de los valores posibles.
for i=1:CantRows
    for j=1:CantCols
        P(i, j) = max( Limites(j, 1), P(i, j));
        P(i, j) = min( Limites(j, 2), P(i, j));
    end
end


end