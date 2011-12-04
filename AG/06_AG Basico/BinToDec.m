function y = BinToDec(x)
% x es un vector fila formado por digitos binarios
long = length(x);

suma =0;
Potencia =1;

for j= long:-1:1,
   suma = suma + x(j) * Potencia;
   Potencia = Potencia * 2;    
end
y = suma;

