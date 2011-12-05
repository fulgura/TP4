function [ Confianza ] = CalcularConfianza( Datos, Reglas, NroClase)
%CALCULARCONFIANZA Summary of this function goes here
%   Detailed explanation goes here
%
% La 'confianza' de una regla se define como:
%
%   CON(X ==> Y) = SOP(X U Y) / SOP(X) 
%                = |X U Y| / |X|   

[CantidadFilas, CantidadColumnas] = size(Datos);
CantidadReglas = length(Reglas);

Soporte = zeros(1, CantidadReglas);
BienClasificados = zeros(1, CantidadReglas);

for j = 1 : CantidadReglas
   for i = 1 : CantidadFilas
       
       regla = all(Datos(i, 1 : CantidadColumnas - 1) == Reglas(:, j)', 2);
       
       if regla == 1
           Soporte(1, j) = Soporte(1, j) + 1;
           BienClasificados(1, j) = BienClasificados(1, j) + (Datos(i, CantidadColumnas) == NroClase);  
       end
   end
end

Confianza = BienClasificados ./ Soporte;
Confianza(isnan(Confianza)) = 0;

end

