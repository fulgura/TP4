function [hijo1, hijo2] = cruzar_y_mutar(Pop,padre1,padre2,pcross,pmutation)

%Aplica crossover y mutacion a las columnas PADRE1 y PADRE2 de POP y 
%calcula dos vectores columna con ambos hijos

[long, col] = size(Pop);
if padre1>col, padre1=col; end
if padre2>col, padre2=col; end

%ver si corresponde aplicar crossover
hayCrossover = ((pcross==1) | (rand<=pcross));
if hayCrossover,
          posicion = round(rand * (long-2)) + 1;
    else  posicion = long;    
end

for i=1:1:posicion,
  hijo1(i,1) = mutar(Pop(i,padre1),pmutation);
  hijo2(i,1) = mutar(Pop(i,padre2),pmutation);
end

if hayCrossover,
  for i=posicion+1:1:long,
     hijo1(i,1) = mutar(Pop(i,padre2),pmutation);
     hijo2(i,1) = mutar(Pop(i,padre1),pmutation);
  end
end  
        
