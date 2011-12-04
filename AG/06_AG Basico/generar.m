function y = generar(Pop, Fitness, pcross, pmutation)
% Genera una nueva poblacion de individuos a partir de Pop
% utilizando seleccion proporcional y con prob. de crossover y mutacion
% segun lo indicado

[long, col] = size(Pop);
col = round(col / 2);   % por cada iteracion se generan dos hijos

y = [];


for i=1:1:col,
    % seleccionar dos padres
    padre1 = select(Fitness);
    padre2 = select(Fitness);
    
    %generar los dos hijos
    [hijo1, hijo2] = cruzar_y_mutar(Pop,padre1,padre2,pcross,pmutation);
    
    y = [y, hijo1, hijo2];
end    


