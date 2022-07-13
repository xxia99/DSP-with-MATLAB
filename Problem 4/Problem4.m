clc;
clear all;
close all;
load('blocksdeconv.mat');
% Problem a
L = length(h);
N = length(x);
M = N + L - 1;
A = cala(h, N);
Ax=A*x;
hx=conv(h,x);
ev=norm(Ax-hx,'fro'); % Verifying the function.
% Problem b
s= svd(A);
smax = s(1); % the largest singular value
smin = s(length(s)); % the smallest singular value
xr = pinv(A)*y;
plot(xr);
% Problem c
xrn = pinv(A) * yn;
figure;
plot(xrn);
ex=norm(x-xrn)^2 ;% the mean-sqaure error
ey=norm(y-yn)^2 ;% the measurement error
% Problem d
[U, S, V] = svd(A);
etemp = 1000;
qtemp = 1;
xtemp = zeros(N,1);
for q= 1:N-1
    At = zeros(M, N);
    for r = 1:N-q
        At = At + S(r, r)*U(:, r)*V(:, r)';
    end
    xtr = pinv(At)*yn;
    eq= norm(xtr - x,'fro')^2;   
    if etemp > eq
        etemp=eq;
        qtemp=q;
        xtemp=xtr;
    end
end
qm=qtemp; % the best q
em=etemp; % the smallest mean-square reconstruction error
xtm=xtemp; % the best xt
figure; 
hold on;
plot(x);
plot(xtm);
% Problem e
d = 0.001;
xtk = V(1:rank(A), :) * pinv(S(1:rank(A), 1:rank(A)).^2 + d*eye(rank(A))) * S(1:rank(A), 1:rank(A)) * U(:, 1:rank(A))' * yn; 
etk = norm(xtk- x)^2 % the smallest mean-square reconstruction error
figure;
hold on;
plot(x)
plot(xtk);
% Problem f
[ya b]=deconv(y,h);
eyc=norm(xrn-ya)^2
eyd=norm(xtm-ya)^2
eye=norm(xtk-ya)^2
% the function calculating matrix A
function A = cala(h, N)
    L = length(h);
    M = N + L - 1;
    A = zeros(M, N);
    Al = zeros(M+N-1, 1);
    Al(N:M) = h;
    for i = 1:M
        for j = 1:N
            A(i, j) = Al((i+N) - j);
        end
    end      
end