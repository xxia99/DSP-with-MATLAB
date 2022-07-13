clc;
clear all;
close all;
A = [2 4 -1; 
    1 -2 1;
    4 0 1;
    5 6 -1;
    8 -4 2];
y = [1; 2; -1; -2; 5];
R = rank([A y]);
[W, T, Z] = svd([A y]);
% Problem (a)
xt = (-1.0/(Z(end,R))) * [Z(1) Z(end,R)] % the total-least squares solution
d = W(:, R)*T(R, R)*Z(:, R)';
% Problem (b)
df = norm(d, 'fro')^2 % the residual error
dA = d(:,1:end-1) % Delta A
dy = d(:,end) % Delta y