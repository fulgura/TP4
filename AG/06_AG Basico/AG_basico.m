% Algoritmo Genetico basico
%==========================

lchrom  = 20        % long. del cromosoma 
popsize = 100        % tamaño de la poblacion 
pcross  = 0.65       % prob.de crossover
pmutation = 0.1   % prob. de mutacion
maxgen   = 50      % maxima cantidad de generaciones

[NroFuncion, cmax, MinInterv, MaxInterv, Intervalo] = ElegirFuncion;
elitismo = input('Elitismo? (1=SI , 0=NO)  --> ');

hold off
%Visualizar la funcion FUN en el intervalo indicado
y = FUN1(Intervalo, NroFuncion);
plot(Intervalo,y);
hold on

%Construir la poblacion inicial
Pop = round(rand(lchrom,popsize));
Fenotipos = CromToNro(Pop, MinInterv, MaxInterv);
Salida = FUN1(Fenotipos, NroFuncion);
Fitness = abs(cmax * ones(1,popsize) - Salida);
plot(Fenotipos,Salida,'*');


gen = 0;
while (gen <= maxgen),
   gen = gen + 1; 
   if elitismo==1
       %guardo el mejor individuo
       [FitMax Mejor] = max(Fitness);
       SuperIndividuo = Pop(:,Mejor);
   end

   NewPop = generar(Pop, Fitness, pcross, pmutation);
   Fenotipos = CromToNro(NewPop, MinInterv, MaxInterv);
   Salida = FUN1(Fenotipos, NroFuncion);
   Fitness = abs(cmax * ones(1,popsize) - Salida);

   Pop = NewPop;
   if elitismo==1
       [FitMin Peor] = min(Fitness);
       if FitMin<FitMax,
          Pop(:,Peor) = SuperIndividuo;
          Fitness(Peor) = FitMax;
       end
   end
   
   hold off
   plot(Intervalo,y);
   hold on
   plot(Fenotipos,Salida,'*');
   pause(0.05)
   
   %fitness maximo y promedio
   FitMax = max(Fitness);
   FitAVG = sum(Fitness)/popsize;
   [FitMax, FitAVG]

end