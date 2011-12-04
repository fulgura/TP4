function y = Fitnes_XOR(w1, b1, w2, b2)
%% w1 (entradas, ocultas)
%  b1 (ocultas, 1)
%  w2 (ocultas, salidas)
%  b2 (salidas, 1)


P= [ 0 0 1 1;
    0 1 0 1];
T = [0 1 1 0];

[entradas, CantPatrones] = size(P);

% Falta calcular SALIDA
% SALIDA es un vector con la respuesta de la RN para c/u de los patrones. Cada neurona de la red es un perceptr?n que utiliza como
% funci?n de activaci?n la funci?n umbral (hardlim).

salidasOcultas = hardlims(w1'*P+b1 * ones(1, CantPatrones));
salida = hardlims(w2' * salidasOcultas + ...
                    b2 * ones(1, CantPatrones))




% Calcular el error de la capa de salida
ErrorSalida = (T-salida);
AVGError = sum(ErrorSalida .^2);

y = 1/(0.001+AVGError);   % funci?n de fitness

end