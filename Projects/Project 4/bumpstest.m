clc;
clear all;
close all;
load('bumps.mat');
w=haar(c, 3);
plot(c)
title('Bumps Signal'); % Show the input signal
figure;
stem(w(1:2^7)); % Show the scaling coefficients at scale J − 3
title('Scaling Coefficients');
figure;
stem(w(2^7+1:end)); % Show the wavelet coefficients at scales J − 3 down to J − 1
title('Wavelet Coefficients');
bumps_err = norm(ihaar(w, 3)- c', 'fro') % Verify that the transform is energy preserving