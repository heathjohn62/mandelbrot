function [ X, Y ] = ps2problem5Heath(x, y)
%   John Heath
%   Evaluates a continuous branch of the multivalued function
%   F(z) = ((i - z) / (i + z))^(1/2) such that F(0) = -1.

% Throw an error if the point is a branch point
if (y == 1 && x >= 0)
    error('Error! z = (%f, %f) belongs to the branch cut along Re(z) >=0 and Im(z) = 1. ', x, y);
end
if (y == -1 && x <= 0)
    error('Error! z = (%f, %f) belongs to the branch cut along Re(z) <=0 and Im(z) = -1. ', x, y);
end

% Start by calculating the magnitude in polar form. 
mag_1 = sqrt(x.^2 + (1 - y).^2);
mag_2 = sqrt(x.^2 + (1 + y).^2);
r = exp(0.5 * (log(mag_1) - log(mag_2)));

% Calculate the phase. 
% Note that atan2 has a range from -pi to pi, just like Arg.
arg_nPi = atan2(1 - y, -x);
arg_n3Pi = atan2(1 + y, x) - 2 * pi;
phase = 0.5 * (arg_nPi - arg_n3Pi);

% Calculate the final coordinates by converting from polar to cartesian.
X = r * cos(phase);
Y = r * sin(phase);
end

