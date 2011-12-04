function y = select(Fitness)
%% 
cuantos = length(Fitness);
sumFitness = sum(Fitness);
aleatorio = rand * sumFitness;  % posicion dentro de la ruleta
suma = Fitness(1);

j = 1;

while (suma < aleatorio) & (j<cuantos),
    j = j + 1;
    suma = suma + Fitness(j);
end


y = j;                  % posici?n   elegida
