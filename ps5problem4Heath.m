% ACM 95a Problem Set 5
% Problem 4 Part C
% John Heath
% Section 9
clc; clear; close all;
% define range to approximate differential equation
tspan1 = [1.0, 2.0];
tspan2 = [1.0, 0.2];
% define differential equation
f = @(t, y) (-2./t).*y + t - 1 + 1./t;
% initial conditions
y0 = 1./3;
% approximate!
[t1, y1] = ode45(f, tspan1, y0);
[t2, y2] = ode45(f, tspan2, y0);
% trim repetitive approximations and concatenate for a plot
t = cat(1, flipud(t2([2:end])), t1);
y = cat(1, flipud(y2([2:end])), y1);
y_exact = @(t) (t.^2)./4 - t./3 + 1./2 - 1./(12.*(t.^2));
y_discrete_exact = y_exact(t);

figure;
plot(t, y_discrete_exact, 'r-o');
hold on;
plot(t, y, 'b-x');
hold off;
legend('Exact', 'Numerical');
title("Exact and numerical solutions of IVP: ty'+2y=t^2-t+1, y(1)=1/3")
figure;
abs_diff = abs(y_discrete_exact - y);
semilogy(t, abs_diff);
title("Magnitude error of numerical solution to IVP: ty'+2y=t^2-t+1, y(1)=1/3");
