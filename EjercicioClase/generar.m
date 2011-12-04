function y = generar(Pop, Fitness, pcross, pmutation)
%% 
[long, col] = size(Pop);
col = round(col / 2);   % por c/iteracion se generan dos hijos
y = [];

for i=1:1:col,
    p1 = select(Fitness);           % seleccionar la posici?n de
    p2 = select(Fitness);           % los dos padres
    % generar los dos hijos
    [h1, h2] = cruzar_y_mutar(Pop,p1,p2,pcross,pmutation);
    y = [y, h1, h2];
end