function A = sampmat(samptimes, N)
    Q = samptimes.*(-(N-1)/2:(N-1)/2);
    A = exp(1j*2*pi*Q);
end