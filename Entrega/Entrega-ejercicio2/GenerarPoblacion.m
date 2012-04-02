function [ Pop ] = GenerarPoblacion( lchrom, popsize)
%GENERARPOBLACION Crea una poblacion aleatoria
%                 utilizando una codifiacion entera de longitud fija. Se
%                 trabaja siempre con un intervalo de 1 a 10.
% 
% Esta genaracion de poblacion solo deja a un 20% de las veces con valor. 
% Esto se hace para poder tener reglas menos complejas.


Pop = zeros(lchrom, popsize);

for j=1:popsize
    for i=1:lchrom
   
        pGen = rand();
        %% Solo el 20%
        if pGen <= 0.2
            %% Valores del 1 al 10. 
            Pop(i,j) = 1 + round(9 * rand());
        end
    end
end
end

