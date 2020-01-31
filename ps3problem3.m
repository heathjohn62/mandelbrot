% ACM 95a Problem Set 3 
% Problem 3
% John Heath

clc; clear; close all;

z = @(t) -cos(t) - 1i .* sin(t);

dz_dt = @(t) sin(t) - 1i .* cos(t);

fun = @(t) exp(1i .* (log(abs(z(t))) + 1i .* atan2(imag(z(t)), real(z(t))))) ...
                 .* dz_dt(t);

integral(@(t) fun(t), 0, pi)
