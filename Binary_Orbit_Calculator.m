%% Orbits
clear;
% Initializing

x1 = [100, 0];
x2 = [0, 0];
v1 = [0, -100];
v2 = [1, 0];
a1 = [0, 0];
a2 = [0 , 0];
F = [];
Ts = 0.001; % If the system diverges when it wasn't supposed to, ajust precision to verify it.
%% Grav Force
G = 6.67*10^-11;
m1 = 10^14; % m2 equal
m2 = 10^16;
%F = -Gm1m2/r^2
v1 = [0, sqrt(G*(m2+m1)/x1(1))];
x = [];
y = [];
X = [];
Y = [];
for i=1:100000
    d = x1 - x2;
    F = -G*m1*m2/(d(1)^2 + d(2)^2)^(1.5)*d;
    a1 = F/m1;
    a2 = -F/m2;
    v1 = v1 + a1*Ts;
    v2 = v2 + a2*Ts;
    x1 = x1 + v1*Ts;
    x2 = x2 + v2*Ts;
    x(i) = x1(1);
    y(i) = x1(2);
    X(i) = x2(1);
    Y(i) = x2(2);
end

plot(x, y);
hold on;
plot(X, Y);
hold off;
xlabel("Horizontal Coordinate")
ylabel("Vertical Coordinate")
title("Binary System Trajectory")