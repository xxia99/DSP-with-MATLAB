x=[1 2 3 4 5 6 7 8];
h=[0 1];
% System (a)
xa=downsample(x,2);
ya=conv(xa,h)
% System (b)
xb=conv(x,h);
yb=downsample(xb,2)
% Error of the two systems
err=norm(ya-yb,'fro')