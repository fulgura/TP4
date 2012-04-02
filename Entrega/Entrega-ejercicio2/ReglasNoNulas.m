function [ P ] = ReglasNoNulas( P, Limites)
%REGLASNONULAS Elimina las reglas nulas agregando valores no nulos en
% alguna de las variables al azar.
% Como parametro recibe la informacion de los limites para cada una de las variables.
%
% [0 4; 0 5; 0 5; 0 2] este vector indica que la primer variable posee
% valores que van de 0 a 4, la segunda variable valores de 0 a 5, y asi
% sucesivamente.
%
% La matriz P se trabaja en forma horizontal, veamos un ejemplo
%
% Pop = [ 0 1 1 1; 0 0 0 1; 0 0 0 0; 1 1 0 0];
%
% Pop = ReglasNoNulas(Pop, [0 4; 0 5; 0 5; 0 2]);
%
% Modificarala matriz Pop, poniendo en forma azarosa un valo no nulo en
% alguna de las variables, obteniendo por ejemplo una nueva matriz de esta
% forma:
%
% [ 0 1 1 1; 0 0 0 1; 0 0 0 2; 1 1 0 0]

%% Busqueda de reglas nulas
Indices = all(P == 0, 2);
[Reglas IndicesReglas] = find(Indices > 0);

%% Alteramos todas la reglas nulas que existan
for index = 1:length(IndicesReglas)
    %% La variable a cambiar sera elegida por azar.
    IndiceValor = round(( size(P, 2) - 1) * rand() ) + 1;
    %% El valor utilizado para reemplazar se calcula por azar pero
    % respetando los limites correspondientes.
    valor = round(( Limites(IndiceValor, 2 ) - 1 ) * rand()) + 1;
    %% Asignamos el nuevo valor en la matriz P para dejar de tener esa
    % regla nula.
    P(Reglas(index), IndiceValor) = valor;
end
end