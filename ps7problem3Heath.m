% ACM 95a Problem Set 7
% Problem 3
% John Heath
% Section 9
clc; clear; close all;

% I'm going to start with the ODE 45 method by reusing code from problem 
% 5 and tweaking it. This will give me some of the setup for the Euler
% approximations. 

% C
% define range to approximate differential equation
tspan = [0.0, 1.0];
% define differential equation
f = @(t, y) ((2 .* t .* y) + (y.^2)) ./ (3 + t.^2);
% initial conditions
y0 = 0.5;
% approximate!
[t, y_ODE45] = ode45(f, tspan, y0);

% A
% Now to perform the Euler approximation. 
% Let's make a time array in which delta_t is 0.025
t_euler = linspace(0, 1, 41);
y_euler = zeros(41,1);
y_euler(1) = y0;
dt = 0.025;
for i = 1:40
    y_euler(i + 1) = y_euler(i) + dt .* f(t_euler(i), y_euler(i));
end

% B
% Now to perform the implicit Euler approximation on the same interval
% I had to kinda guess at the sign in the quadratic formula, so I will
% sanity check my answer and make sure the minus sign is the correct
% choice.
y_backwards = zeros(41,1);
y_backwards(1) = y0;
for i = 1:40
    tnp1 = t_euler(i) + dt;
    b = 2 .* tnp1 - (1./dt) .* (3 + tnp1.^2);
    c = y_backwards(i) ./ dt .* (3 + tnp1.^2);
    % The minus sign was MUCH more correct than the positive result,
    % demonstrating that the intuition worked out on paper was correct.
    y_backwards(i + 1) = (-b - sqrt(b.^2 - 4 .* c)) ./ 2;
end


figure;
plot(t, y_ODE45, 'r-o');
hold on;
plot(t, y_euler, 'b-x');
plot(t, y_backwards, 'g-s');
hold off;
legend('ODE45', 'Explicit Euler', 'Implicit Euler');
title("Explicit vs. implict Euler methods in approximating a nonliner ODE");