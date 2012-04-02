function [ Confianza ] = CalcularConfianza( Datos, Reglas, NroClase)
%CALCULARCONFIANZA Summary of this function goes here
%   Detailed explanation goes here
%
% La 'confianza' de una regla se define como:
%
%   CON(X ==> Y) = SOP(X U Y) / SOP(X)  = |X U Y| / |X|
%

[CantidadFilas, CantidadColumnas] = size(Datos);
CantidadReglas = length(Reglas);

BienClasificados = zeros(1, CantidadReglas);

Total = zeros(1,CantidadReglas);

for j = 1 : CantidadReglas
    for i = 1 : CantidadFilas
        
        regla = all(Datos(i, 1 : CantidadColumnas - 1) == Reglas(:, j)', 2);
        
        if regla == 1
            Total(j) = Total(j) + 1;
            if (Datos(i, CantidadColumnas) == NroClase)
                BienClasificados(1, j) = BienClasificados(1, j) + 1;
            end
            
        end
    end
end

Confianza = BienClasificados ./ Total;
Confianza(isnan(Confianza)) = 0;

end

