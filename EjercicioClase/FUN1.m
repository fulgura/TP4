function [ y ] = FUN1( x )
%FUNC1 Summary of this function goes here
%   Detailed explanation goes here
%FUN1(x) = x * x

%y = x .* x;

y = ((-x) .* sin(10 * pi * x) )+ ones(1,length(x));
end

