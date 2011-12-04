%% Ejercicio hecho en clase

clc;
clear all;


lchrom  = 20 ;           % long. del cromosoma
popsize = 50;            % tama?o de la poblacion
pcross  = 0.65;          % probabilidad de crossover
pmutation = 0.001;   % probabilidad de mutacion
maxgen   = 500;         % m?x. cant.de generaciones

cmax = 2500;
MinInterv = -10;
MaxInterv = 50;

%% Visualizar la funci?n FUN1 en el intervalo indicado
hold off
Intervalo = MinInterv:0.1:MaxInterv;
y = FUN1(Intervalo);
plot(Intervalo,y);
hold on

%% Construcci?n y visualizaci?n de la poblacion inicial
Pop = round(rand(lchrom,popsize));
Fenotipos = CromToNro(Pop, MinInterv, MaxInterv);
Salida = FUN1(Fenotipos);
Fitness = abs(cmax * ones(1, popsize) - Salida);
plot(Fenotipos,Salida,'*');

%% Algoritmo propiamente dicho
FitMejor = max(Fitness);
IgualMejor = 0;
gen = 0;
while (gen <= maxgen) & (IgualMejor < 20 ),
    
    gen = gen + 1;
    %% ELITIMSO: salvando el mejor
    [FitMax quien] = max(Fitness);
    SuperIndividuo = Pop(:, quien);
    SuperFenotipo = Fenotipos(:, quien); %% Solo para dibujar
    
    NewPop = generar(Pop, Fitness, pcross, pmutation);
    Fenotipos = CromToNro(NewPop, MinInterv, MaxInterv);
    
    Salida = FUN1(Fenotipos);
    Fitness = abs(cmax * ones(1,popsize) - Salida);
    Pop = NewPop;

    %% ELITIMSO: Cambiamos el mejor anterior por el peor
    [FitMin peor] = min(Fitness);
    Pop(:, peor) = SuperIndividuo;
    Fitness(peor) = FitMax;
    
    Fenotipos(peor) = SuperFenotipo;
    Salida(peor) = FUN1(Fenotipos(peor));
 
    %% Verificamos si el mejor sigue siendo el mismo y sumamos uno
    % o reseteamos el contador
    if (FitMax == max(Fitness))
        IgualMejor = IgualMejor + 1;
    else
        IgualMejor = 0;
    end
    
    
    %% Redibujar
    hold off
    plot(Intervalo,y);
    hold on
    plot(Fenotipos,Salida,'*');
    
    [FitMax quien] = max(Fitness);
    salida = FUN1(Fenotipos(quien));
    plot(Fenotipos(quien), salida, '*r');
    pause(0.5)

    fprintf('%d %d %1.4f %1.4f\n', gen, IgualMejor, FitMax, Fenotipos(quien));
    
end



