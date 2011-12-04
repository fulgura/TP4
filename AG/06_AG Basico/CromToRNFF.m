function [w1, b1, w2, b2] = CromToRNFF(x, entradas, ocultas, salidas, Hay_b1, Hay_b2)

% x es un vector fila con los pesos de la RN feedforward concatenados de la siguiente forma
% w1_11, w1_21,  w1_12, w1_22,  b1_1, b1_2,  w2_1 , w2_2,  b2]
%| x1-->o1    |    x2-->o2   | x0 -->o1,o2 |  o1,o2-->s  | o0-->s

%entradas, ocultas y salidas representan el tamaño de cada capa de la red

%Hay_b1 vale 1 si cada neurona de la capa oculta usa bias y 0 si no
%Hay_b2 vale 1 si cada neurona de la capa de salida usa bias y 0 si no

%La cantidad de bits por peso se puede obtener en base a la longitud del cromosoma y a la cantidad de pesos en la arquitectura
%se asume que la representacion utilizada es binaria

% Las dimensiones de cada una de las estructuras a retonar es:
%          w1 --> de (entradas x ocultas)
%          b1 --> de (ocultas x 1) 
%          w2 --> de (ocultas x salidas)
%          b2 --> de (salidas x 1) 

MinInterv = -1;
MaxInterv = 1;

CantPesos = entradas*ocultas + ocultas*salidas;

if (Hay_b1==1),
    CantPesos = CantPesos + ocultas;
end
if (Hay_b2==1),
    CantPesos = CantPesos + salidas;
end

[fila,long] = size(x);
BitsXPeso = fix(long / CantPesos);
ValorMax = 2^BitsXPeso -1;

k = 1; %posicion inicial del proximo peso a convertir

% w1 es de (entradas x ocultas)
w1 = [];
for j=1:ocultas,
    for i=1:entradas,
       PesoBinario = x(k : k + BitsXPeso - 1);
       PesoDecimal = BinToDec(PesoBinario);     
       PesoReal = MinInterv + (PesoDecimal/ValorMax) * (MaxInterv - MinInterv);
       
       w1(i,j) = PesoReal;
       k = k + BitsXPeso;
   end   
end    

if (Hay_b1==1),
   % b1 es de (ocultas x 1)
   b1 = [];
   for j=1:ocultas,
       PesoBinario = x(k : k + BitsXPeso - 1);
       PesoDecimal = BinToDec(PesoBinario);
       PesoReal = MinInterv + (PesoDecimal/ValorMax) * (MaxInterv - MinInterv);
      
       b1(j,1) = PesoReal;
       k = k + BitsXPeso;
   end    
end

% w2 es de (ocultas x salidas)
w2 = [];
for j=1:salidas,
    for i=1:ocultas,
       PesoBinario = x(k : k + BitsXPeso - 1);
       PesoDecimal = BinToDec(PesoBinario);
       PesoReal = MinInterv + (PesoDecimal/ValorMax) * (MaxInterv - MinInterv);
       
       w2(i,j) = PesoReal;
       k = k + BitsXPeso;
   end   
end    

if (Hay_b2==1),
   % b2 es de (salidas x 1)
   b2 = [];
   for j=1:salidas,
       PesoBinario = x(k : k + BitsXPeso - 1);
       PesoDecimal = BinToDec(PesoBinario);
       PesoReal = MinInterv + (PesoDecimal/ValorMax) * (MaxInterv - MinInterv);
      
       b2(j,1) = PesoReal;
       k = k + BitsXPeso;
   end    
end


