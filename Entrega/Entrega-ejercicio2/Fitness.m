function [ Soporte, Confianza, Aptitud ] = Fitness( Datos, Reglas, Clase, NroClase )

[CantDatos, CantCols] = size(Datos);
CantReglas = size(Reglas, 2);

antencedente = zeros(1, CantReglas);
correctos = zeros(1, CantReglas);

for j=1:CantReglas
    for i=1:CantDatos
        esIgual = 1;
        k = 1;
        while esIgual && k <= CantCols
            if (Reglas(k, j) > 0) && (Reglas(k, j) ~= Datos(i,k))
                esIgual = 0;
            end
            k = k + 1;
        end
        if (esIgual == 1)
            antencedente(1,j) = antencedente(1,j) + 1;
            correctos(1,j) = correctos(1,j) + (Clase(i) == NroClase);
        end
    end
end

Confianza = correctos ./ antencedente;
Confianza(isnan(Confianza))=0;
Soporte = correctos ./ CantDatos;
Aptitud = (Soporte + Confianza) ./ (2);
end

