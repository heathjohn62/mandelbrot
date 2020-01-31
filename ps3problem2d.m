% ACM 95a Problem Set 3 
% Problem 2 Part D
% John Heath

clc; clear; close all;

z = @(t) t + 1i .* cos(pi * t);

dz_dt = @(t) 1 - 1i .* pi .* sin(pi * t);

fun = @(t) z(t).^(-1/3) .* dz_dt(t);

% This is a function that performs the integral using the specified value
% of r.

integral(@(t) fun(t), 0, 1)
