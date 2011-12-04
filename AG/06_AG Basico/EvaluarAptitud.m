function y = EvaluarAptitud(Poblacion)
% Decodifica cada RN y calcula el fitness
[long,cuantos] = size(Poblacion);
entradas = 2;	
ocultas  = 2;	
salidas  = 1;
y = [ ];
for i = 1 : cuantos,     %Obtener la RN del individuo i
    individuo = Poblacion(:,i)';
    [w1 b1 w2 b2] = CromToRNFF(individuo, entradas,...
                                  ocultas, salidas, 1, 1);
    y(i) = Fitnes_XOR(w1, b1, w2, b2);
end
