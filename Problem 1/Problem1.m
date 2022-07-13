x = @(z) (z < 1/4).*(4*z) + (z>=1/4).*(z<1/2).*(-4*z+2) - (z>=1/2).*sin(20*pi*z);
phi = @(z) exp(-z.^2); 
t = linspace(0, 1, 1000);
y = zeros(size(t));
plot(t,x(t));
hold on
N=50;
A=zeros(N,N);
B=zeros(N,1);
for ii=1:N
    tempi= @(z) x(z).*phi(N*z - ii + 1/2);
    B(ii,1)=integral(tempi, 0, 1);    
    for jj=1:N
        tempij=@(z) phi(N*z - ii + 1/2).*phi(N*z - jj + 1/2);
        integral(tempij, 0, 1);
        A(ii,jj)=integral(tempij, 0, 1);
    end
end
a=inv(A)*B;
for jj = 1:N
    y = y + a(jj)*phi(N*t - jj + 1/2);
end
plot(t, y);
legend('x','x^');