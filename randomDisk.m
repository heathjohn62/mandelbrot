function z=randomDisk(z0,R,n)

% This function generates n points z1,...,zn distributed uniformly 
% at random in the disk |z-z0|<R.

r=R*sqrt(rand(1,n));
theta=2*pi*rand(1,n);
x=r.*cos(theta);
y=r.*sin(theta);
z=z0+x+1i*y;