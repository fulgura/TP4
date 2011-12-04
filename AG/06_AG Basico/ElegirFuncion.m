%function [cmax, limites, paso, valorElegido] = ElegirFuncion;
function [valorElegido, cmax, MinInterv, MaxInterv, Intervalo] = ElegirFuncion;

disp('--- FUNCIONES ---');
disp('1--> f(x) = x^2');
disp('2--> f(x) = ((-x) .* sin(10 * pi * x) )+ ones(1,length(x))');
disp('3--> f(x) = 0.5+((sin( sqrt(x.^2) ).^2-0.5)./(1+0.001*(x.^2)).^2)');
disp('4--> f(x) = sin( sqrt(x.^2 +100 ) )./ sqrt( x.^2+1)');
valorElegido = input('Ingrese un nro.entre 1 y 4  --> ');
switch valorElegido 
 case 1
    %===== f(x) = x^2 ======
   cmax = 25;
   % rango en el que varia el argumento de la funcion
   MinInterv = -1;
   MaxInterv = 5;
   Intervalo = [-1:0.01:5];
 case 2
   %===== f(x) = sin(x * pi ...) ======
   cmax = 3;
   MinInterv = -2;
   MaxInterv = 1;
   Intervalo = [-2:0.005:1];

 case 3
   %===== f(x) = 0.5+((sin( sqrt(x.^2) ).^2-0.5)./(1+0.001*(x.^2)).^2);  ======
   cmax = 1;
   MinInterv = -50;
   MaxInterv = 50;
   Intervalo = [-50:0.01:50];

  case 4
   %===== f(x) = sin( sqrt(x.^2 +100 ) )./ sqrt( x.^2+1);    ======
   cmax = 1;
   MinInterv = -50;
   MaxInterv = 50;
   Intervalo = [-50:0.01:50];
end
