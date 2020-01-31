% ACM95a Problem Set 4
% Problem 2 Part B
% John Heath
clc; clear; close all;

% Define an Argument function that is consistent with the principal value
% used in this course. The angle function in matlab disagrees on the 
% branch cut. 
Arg = @(z) (imag(z) == 0 & real(z) < 0) .* (-1 .* pi) + ...
              (imag(z) ~= 0 | real(z) >= 0) .* angle(z);
          
% Define f(z) = (z + 1)^i
f = @(z) exp(1i .* (log(abs(z + 1)) + 1i .* Arg(z + 1)));

% Define g(z)
g = @(z) 1 + 1i .* z + (1./2) .* (-1 - 1i) .* z.^2;

% Define d(z) = |f(z) - g(z)|
d = @(z) abs(f(z) - g(z));

% Evaluate d on all points
n= 10000;
points = randomDisk(0, 1, n);
distances = d(points);

% make the plot
scatter(real(points), imag(points), [], distances, 'filled');
colorbar;