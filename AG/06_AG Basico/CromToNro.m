function y = CromToNro(x, MinInterv,MaxInterv)
% CromToNro(x,long) convierte la matriz X, cuyas columnas son cromosomas,
% en un vector fila con los fenotipos (ptos.donde debe evaluarse la funcion)

[long, col] = size(x);
y = [];

for i=1:1:col,
    suma =0;
    Potencia =1;

    for j= long:-1:1,
       if x(j,i)==1,  
            suma = suma + Potencia;
       end    
       Potencia = Potencia * 2;    
    end
    aux = 2^long -1;
    y(i) = MinInterv + suma * ( (MaxInterv - MinInterv) / aux );
    
end    


