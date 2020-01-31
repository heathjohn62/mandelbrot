% ACM 95a Problem Set 3 
% Problem 2 Part A
% John Heath

clc; clear; close all;

z = @(t) pi .* cos(t) + pi * 1i .* sin(t);

fun = @(t) cos(z(t)) ./ ((z(t) - 1i) .* (z(t) - 1)) .* pi ...
           .* (-sin(t) + 1i .* cos(t));

% This is a function that performs the integral using the specified value
% of r.

integral(@(t) fun(t), 0, 2 * pi)

