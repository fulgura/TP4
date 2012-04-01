function [ h1, h2 ] = CruzarMutar( Pop,p1,p2,pcross,pmutation )
%% 
%
%
%

%%
[long, col] = size(Pop);

hayCrossover = ((pcross == 1) | (rand <= pcross));

if hayCrossover,
    posicion = round(rand * (long-2)) + 1;
else
    posicion = long;
end

[ posicion ]

for i=1:1:posicion,
  h1(i,1) = Mutar(Pop(i,p1),pmutation);
  h2(i,1) = Mutar(Pop(i,p2),pmutation);
end

if hayCrossover,
    
  for i = posicion+1:1:long,
     h1(i,1) = Mutar(Pop( i, p2), pmutation);
     h2(i,1) = Mutar(Pop( i, p1), pmutation);
  end

end

