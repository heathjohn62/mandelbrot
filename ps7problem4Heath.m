% ACM 95a Problem Set 7
% Problem 4 B
% John Heath
% Section 9
clc; clear; close all;

% ODE 45
% define range to approximate differential equation
tspan = [0.0, 1.0];
% define differential equation
f = @(t, y) (t.^2 - y.^2) .* sin(y);
% initial conditions
y0 = 1.0;
% approximate!
[t, y_ODE45] = ode45(f, tspan, y0);

%Euler approximation. 
% Let's make a time array in which delta_t is 0.025
t_euler = linspace(0, 1, 41);
y_euler = zeros(41,1);
y_euler(1) = y0;
dt = 0.025;
for i = 1:40
    y_euler(i + 1) = y_euler(i) + dt .* f(t_euler(i), y_euler(i));
end

% Heun's Method
y_heun = zeros(41,1);
y_heun(1) = y0;
for i = 1:40
    heun = y_heun(i);
    time = t_euler(i);
    tnp1 = t_euler(i) + dt;
    euler = heun + dt .* f(t_euler(i), heun);
    heun = heun + (dt./2) .* (f(time, heun) + f(tnp1, euler));
    y_heun(i + 1) = heun;
end


figure;
plot(t, y_ODE45, 'r-x');
hold on;
plot(t, y_euler, 'b-o');
plot(t, y_heun, 'black-d');
hold off;
legend('ODE45', "Euler's Method", "Heun's Method");
title("Euler's vs. Heun's Methods in approximating a nonliner ODE");