clc;

clear all;

%se utilizaran 5 bits por peso. Hay 9 pesos en la RN -->
lchrom  = 45;        % long. del cromosoma

popsize = 70;        % tama?o de la poblacion
pcross  = 0.65;       % prob.de crossover
pmutation = 0.05;   % prob. de mutacion
elitismo = 1;        % 0 sin elitismo, 1 si
maxgen   = 20;      % maxima cantidad de generaciones

%Construir la poblacion inicial
Pop = round(rand(lchrom,popsize));

%== Aptitud de cada una de las RN ======
Fitness = EvaluarAptitud(Pop);


% ===== Graficar el mejor individuo ======
P= [ 0 0 1 1;
    0 1 0 1];
T = [0 1 1 0];

plotpv(P, T);
[maximo, mejor] = max(Fitness);
SuperIndividuo = Pop(:, mejor)';

[w1, b1, w2, b2] = CromToRNFF(SuperIndividuo, 2, 2, 1, 1, 1);
linea = plotpc(w1', b1);


gen = 0;
while (gen <= maxgen),
    gen = gen + 1;
    if elitismo==1
        %guardo el mejor individuo
        [FitMax Mejor] = max(Fitness);
        SuperIndividuo = Pop(:,Mejor);
    end
    
    NewPop = generar(Pop, Fitness, pcross, pmutation);
    Fitness = EvaluarAptitud(NewPop);
    
    Pop = NewPop;
    if elitismo==1
        [FitMin Peor] = min(Fitness);
        if FitMin<FitMax,
            Pop(:,Peor) = SuperIndividuo;
            Fitness(Peor) = FitMax;
        end
    end
    
    %% Dibujo
    hold off
    [maximo, mejor] = max(Fitness);
    SuperIndividuo = Pop(:, mejor)';
    
    [w1, b1, w2, b2] = CromToRNFF(SuperIndividuo, 2,2, 1, 1, 1);
    linea = plotpc(w1', b1, linea);
    hold on
    pause(0.05);
    
    
    %% fitness maximo y promedio
    FitMax = max(Fitness);
    FitAVG = sum(Fitness)/popsize;
    [FitMax, FitAVG]
    
end