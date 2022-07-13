B = randn(10, 10);
A = B + B';
[E,numit]=compe(A);
numit % Number of iterations
lva = E % The largest eigenvalue
lve = null(E*eye(length(A))-A,'r') % The corresponding eigenvector