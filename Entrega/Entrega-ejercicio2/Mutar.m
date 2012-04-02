function AleloNuevo = Mutar( Alelo, Prob)
%MUTAR mutacion del ALELO con una probabilidad inidicada
%   Basandose en la probabilidad de ocurrencia, se realiza la mutacion de
%   un alelo sumando o restando en una unidad el valor del parametro Alelo
%
%
if ( Prob == 1) | (rand <= Prob),
    
    if (rand <= 0.5)
        AleloNuevo = Alelo + 1;
    else
        AleloNuevo = Alelo - 1;
    end
else
    AleloNuevo = Alelo;
end 