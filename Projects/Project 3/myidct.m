function x=myidct(y)
    N=length(y);
    y(1)=sqrt(2)*y(1);
    x2N = ifft(sqrt(2*N)*[y;0;-1*flip(y(2:N))].* exp(-1i*pi*(1-1/(2*N))*(0:2*N-1)'));% Expand yN to y2N and conduct ifft on the sequence shifted by y2N
    x = real(x2N(N+1:2*N));% Extract the N+1 to 2N elements in x2N which can be reconstructed as xN 
end