% ACM95a Problem Set 4
% Problem 5 Part c
% John Heath
clc; clear; close all;

% Define f(z)
f = @(z) 1./(z .* (1 - z));

% Define g(z)
g = @(z) -.5.*(2 .* (-1).^(-10 + 1) .* (z - 1).^(-10) + ...
          2 .* (-1).^(-9 + 1) .* (z - 1).^(-9) + ...
          2 .* (-1).^(-8 + 1) .* (z - 1).^(-8) + ...
          2 .* (-1).^(-7 + 1) .* (z - 1).^(-7) + ...
          2 .* (-1).^(-6 + 1) .* (z - 1).^(-6) + ...
          2 .* (-1).^(-5 + 1) .* (z - 1).^(-5) + ...
          2 .* (-1).^(-4 + 1) .* (z - 1).^(-4) + ...
          2 .* (-1).^(-3 + 1) .* (z - 1).^(-3) + ...
          2 .* (-1).^(-2 + 1) .* (z - 1).^(-2) + ...
          2 .* (-1).^(-1 + 1) .* (z - 1).^(-1));

% Define d(z) = |f(z) - g(z)|
d = @(z) abs(f(z) - g(z));

% Evaluate d on all points
n= 10000;
points = randomDisk(0, 20, n);
points = points + 2 .* exp(1i.*angle(points)) + 1;
distances = d(points);

% make the plot
scatter(real(points), imag(points), [], distances, 'filled');
colorbar
%caxis([.1 2])
title("Difference between 10th order approximation and f(z)")