% ACM95a Problem Set 4
% Problem 2 Part B
% John Heath
clc; clear; close all;

% Define an Argument function that is consistent with the principal value
% used in this course. The angle function in matlab disagrees on the 
% branch cut. 
Arg = @(z) (imag(z) == 0 & real(z) < 0) .* (-1 .* pi) + ...
              (imag(z) ~= 0 | real(z) >= 0) .* angle(z);
          
% Define f(z)
f = @(z) 1./(z .* (1 - z));

% Define g(z)
g = @(z)  -1./z.^2 - 1./z.^3 - 1./z.^4 - 1./z.^5 - 1./z.^6 - 1./z.^7 ;


% Define d(z) = |f(z) - g(z)|
d = @(z) abs(f(z) - g(z));

% Evaluate d on all points
n= 10000;
points = randomDisk(0, 1, n);
points = points + 1 .* exp(1i.*angle(points));
distances = d(points);

% make the plot
scatter(real(points), imag(points), [], distances, 'filled');
colorbar
caxis([.0001 .5])
title("Difference between -7th order approximation and f(z)")