% ACM 95a Problem Set 3 
% Problem 2 Part C
% John Heath

clc; clear; close all;

z = @(t) cos(t) + 1i .* sin(t);
dz_dt = @(t) -sin(t) + 1i .* cos(t);

fun = @(t) exp(z(t).^3 + pi) / (z(t) + 3).^3 .* dz_dt(t);

% This is a function that performs the integral using the specified value
% of r.

integral(@(t) fun(t), 0, 2 * pi)
