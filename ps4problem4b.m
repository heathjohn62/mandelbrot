% ACM 95a Problem Set 4
% Problem 4 Part B
% John Heath

clc; clear; close all;

z = @(t) pi .* (cos(t) + 1i .* sin(t));
dz_dt = @(t) pi .* (-sin(t) + 1i .* cos(t));

fun = @(t) (1./(4 .* z(t).^2) + 1./z(t)) .* dz_dt(t);

% This is a function that performs the integral using the specified value
% of r.

integral(@(t) fun(t), 0, 2 * pi)
