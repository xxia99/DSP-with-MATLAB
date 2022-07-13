L = 4;
w = [-pi:0.001:pi];
t = [-100:0.001:100];
rw=length(w);
rt=length(t);
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
h_L = [flip(h_n) h_n(2:end)]/ rw; % Compute h_L[n]

b=@(x) bspline(x,L);
x = @(t) 0.*(t<=0) + 0.5 .* ((t>0) .* (t<=10)) - sin(pi*t/10) .* ((t>10) .* (t<=20)) + 0.*(t>20);
f_in = @(t, n, l) (x(t) .* b(t-n-l));
d = zeros(1, 201);
y = zeros(1, rt);
% Compute the solution y(t)
for i = -100:100
    for j = 1:41
        d(i+100+1) = d(i+100+1)  + h_L(j) * integral(@(t)(f_in(t, i, j - (21))), -100, 100);
    end
    y = y + d(i+100+1) * b(t-i);
end
% Plot the figure of x(t) and y(t)
plot(t, x(t));
hold on;
plot(t, y);
legend("x(t)","y(t)");

