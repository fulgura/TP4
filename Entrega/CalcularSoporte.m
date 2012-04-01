function [ Soporte ] = CalcularSoporte( Datos, Reglas, NroClase)
%CALCULARSOPORTE Calculo del soprte para las Reglas en la variable Datos
%
% El 'soporte' de un conjunto de items X en una base de datos D se define
% como la proporcion de transacciones en la base de datos que contiene dicho conjunto de items:
%
%   SOP(X) = |X| / |D|
%             

[CantidadFilas, CantidadColumnas] = size(Datos);

CantidadReglas = length(Reglas);

ReglasClase = [Reglas ; NroClase * ones(1, CantidadReglas)];

Soporte = zeros(1, CantidadReglas);

for j = 1 : CantidadReglas
    for i = 1 : CantidadFilas
        Soporte(1, j) = Soporte(1, j) + all(Datos(i, 1:CantidadColumnas) == ReglasClase(:, j)', 2);
    end
end

Soporte = Soporte / CantidadFilas;
end

