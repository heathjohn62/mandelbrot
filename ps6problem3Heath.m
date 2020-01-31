% ACM 95a Problem Set 6
% Problem 3
% Section 9
% John Heath
clc; clear; close all;

% Define the initial conditions vector Y0 = [y(1); y'(1)]
Y0 = [3;0];
% Define the function F(t, Y) = Y' = [y'; y''] in terms of the vector
% Y = [y, y']
F = @(t, Y) [Y(2); (2 ./ t.^2) .* Y(1) + 3 - 1 ./ t.^2];
% We want to solve on the interval [1, 2]
tspan = [1, 2];
% Approximate the ODE!
[t, Y] = ode45(F, tspan, Y0);
y_approx = Y(:,1);

% Now I should find the numerical solution
f = @(t) t.^2 .* log(t) + t.^2 ./ 2 + 1./2 + 2./t;
y_exact = f(t);

% Time to make plots!
figure;
plot(t, y_approx, 'r-o');
title("Approximate solution and exact solution to 2nd order ODE");
hold on;
plot(t, y_exact, 'b-x');
hold off;
legend('ODE45 Approximation', 'Exact Solution')

% Plot magnitude error
figure;
error = abs(y_exact - y_approx);
semilogy(t, error);
title("Magnitude error of ODE45 approximation")
