% ACM 95a Problem Set 7
% Problem 5 Part B
% John Heath
% Section 9
clc; clear; close all;

% define differential equation
f = @(t, y) ((2 .* t .* y) + (y.^2)) ./ (3 + t.^2);
% initial conditions
y0 = 0.5;
% Define actual solution
sol = @(t) (3 + t.^2) ./ (6 - t);
% Define the range on which we want to approximate and plot the solution. 
t = linspace(0, 1, 41).';
y_exact = sol(t);

% Now to perform the Runge-Kutta approximation
y_kutta = zeros(41,1);
y_kutta(1) = y0;
dt = 0.025;
for i = 1:40
    yn = y_kutta(i);
    tn = t(i);
    k1 = f(tn, yn);
    k2 = f(tn + dt./2, yn + dt .* k1 ./ 2);
    k3 = f(tn + dt./2, yn + dt .* k2 ./ 2);
    k4 = f(tn + dt, yn + dt .* k3);
    y_kutta(i + 1) = yn + dt .* (k1 + 2.*k2 + 2.*k3 + k4) ./ 6;
end


figure;
plot(t, y_exact, 'r-o');
hold on;
plot(t, y_kutta, 'b-x');
hold off;
legend('Exact', 'Runge-Kutta Approximation');
title("Exact and numerical solutions of nonlinear IVP")
figure;
abs_diff = abs(y_exact - y_kutta);
semilogy(t, abs_diff);
title("Magnitude error of numerical solution to nonlinear IVP");
