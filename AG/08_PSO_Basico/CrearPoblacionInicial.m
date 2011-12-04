function p = CrearPoblacionInicial(popsize, limites, limVELOC)
% genera un vector de popsize inidividuos aleatorios
% cada uno es una estructura con los valores necesarios

p = [];

for i=1:popsize
    nuevo = rand*(limites(2)-limites(1))+limites(1);
    veloc = rand*(limVELOC(2)-limVELOC(1))+limVELOC(1);

    p = [p struct('individuo', nuevo, 'velocidad', veloc, 'pBest', nuevo, 'fitness',0,'fitpBest',0)];
end

