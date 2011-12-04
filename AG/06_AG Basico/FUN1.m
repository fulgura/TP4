function y = FUN1(x, nroFun)

switch nroFun
    case 1 
       y = x .* x;
    case 2
       y = ((-x) .* sin(10 * pi * x) )+ ones(1,length(x));
    case 3
       y = 0.5+((sin( sqrt(x.^2) ).^2-0.5)./(1+0.001*(x.^2)).^2);
    case 4
       y = sin( sqrt(x.^2 +100 ) )./ sqrt( x.^2+1);
end
