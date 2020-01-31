% ACM 95a Problem Set 4
% Problem 4 Part A
% John Heath

clc; clear; close all;

z = @(t) cos(t) + 1i .* sin(t) + 1;
dz_dt = @(t) -sin(t) + 1i .* cos(t);

fun = @(t) (z(t) ./ 4 + 2.^4 .* (z(t)./4).^2 + 100000 .* z(t).^10) ...
           .* sin(1i .* z(t)) .* dz_dt(t);

% This is a function that performs the integral using the specified value
% of r.

integral(@(t) fun(t), 0, 2 * pi)
