clc;
close all;
clear all;
load('hw8pbandlimited.mat');
N = 51;
A = sampmat(samptimes, N);
plot(samptimes, y);
hold on;
t =(0:0.001:1);
f = sampmat(t', N) * (pinv(A)*y);
plot(t, f);
legend('real','estimate');