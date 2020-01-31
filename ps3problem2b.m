% ACM 95a Problem Set 3 
% Problem 2 Part B
% John Heath

clc; clear; close all;

z = @(t) 1i * t;

fun = @(t) conj(z(t)) * 1i;

% This is a function that performs the integral using the specified value
% of r.

integral(@(t) fun(t), 0, 2)
