function [ P ] = Discretizar( Datos, CantidadIntervalos )
%% Discretiza los datos en 4 o 7 intervalos, segun corresponda basandose en
% el parametro CantidadIntervalos
% 
% Si la cantidad de intervalos es igual a 7 e trabaja con los intervalos:
%
%   IntervalosSiete = [1 1 2 3 4 5 6 6 7 7];
%
% De lo contrario se asume que el default seran los cuatro intervalos:
%
%   IntervalosCuatro = [1 1 2 2 2 3 3 3 4 4];
%

IntervalosSiete     = [1 1 2 3 4 5 6 6 7 7];
IntervalosCuatro    = [1 1 2 2 2 3 3 3 4 4];


if CantidadIntervalos == 7
    intervalos = IntervalosSiete;
else 
    intervalos = IntervalosCuatro;
end

[CantRows, CantCols] = size(Datos);
P = zeros(CantRows, CantCols);
for i=1:CantRows
    for j=1:CantCols
        if Datos(i,j) > 0
            P(i,j) = intervalos(Datos(i,j));
        end
    end
end

end