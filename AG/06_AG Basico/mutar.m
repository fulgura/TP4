function NewAlelo = mutar( Alelo, probabilidad)

%muta el ALELO con la probabilidad inidicada

if (probabilidad==1) | (rand<=probabilidad),
    % hay mutacion
    NewAlelo = ~Alelo;
else
    NewAlelo = Alelo;
end    