% ACM 95a Problem Set 3 
% Problem 1 Part B
% John Heath

clc; clear; close all;

% define a z(t) for ease of reading
z = @(t, R) R .* sin(t) - 1i .* R .* cos(t);
% First I will numerically evaluate the actual integral 
% This is the function to be integrated with respect to t
fun = @(t, R) (z(t, R) + log(R) + 1i .* (t - pi ./ 2)) ./ ...
    ((z(t, R)).^3 + 1) .* R .* (1i .* sin(t) + cos(t));

% This is a function that performs the integral using the specified value
% of r.
fun2 = @(R) abs(integral(@(t)fun(t, R), 0, pi));

% Now I will loop through r values from 2 to 30 and make an array of
% values.
resolution = 100;
r_dist = linspace(2, 30, resolution);
approx = zeros(resolution, 1);
for i = 1:resolution
    r = r_dist(i);
    approx(i) = fun2(r);
end
ml_bound = pi .* (r_dist.^2 + r_dist .* log(r_dist) + pi / 2 .* r_dist) ./ ...
          (r_dist.^3 - 1);

p = plot(r_dist, ml_bound, r_dist, approx);
legend({'ML Bound','Approximate Magnitude of Actual Integral'},...
       'Location','Northeast');
xlabel("R");
title("ML bound vs. Integral Approximation");