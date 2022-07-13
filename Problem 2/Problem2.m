clc;
clear all;
close all;
%% Problem 6.3(a)
L = 1;
w = [-pi:0.001:pi];
rw=length(w);
h_t = zeros(1, rw);
for i = 1:rw
    h_s = 0;
    for j = -100:100
        h_s = h_s + ((sin((w(i)/2) + pi*j)) / ((w(i)/2) + pi*j)) ^ (2*L+2);
    end
    h_t(i) = 1 /h_s;
end
h_n = zeros(1, 21);
for i = 1:20
    h_n(i) = sum(h_t .* cos(w*(i-1)));
end
% Compute h_L[n]
h_L = [fliplr(h_n), h_n(2:end)]/ (rw);
% Plot the figure of h_L
stem([-20:20], h_L);
title('h_L')
%% Problem 6.3(b)
t = [-100:0.001:100];
rt = length(t);
b_d = zeros(1, rt);
b=@(x) bspline(x,L);
% Compute dual B-spline functions b_L[t]
for i = 1:41
    b_d = b_d + h_L(i) .* b(t-(i-21));
end
% Plot the figure of b_L[t]
plot(t, b_d)
xlim([-20 20]);
title('b_L');

