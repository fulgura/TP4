function y = CromToNro(x, MinInterv,MaxInterv)
% x es una matriz de 20x50
% y es un vector con el valor de los fenotipos
[long, col] = size(x);
ValorMax = 2^long - 1;
y = [ ];
for i = 1:1:col,
    nro   = bi2de(x(:,i)' , 'left-msb' );
    y(i) = MinInterv + (nro/ValorMax) * (MaxInterv - MinInterv);
end