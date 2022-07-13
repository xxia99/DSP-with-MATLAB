A = [10000 10001; 10001 10002; 10002 10003; 10003 10004; 10004 10005];
b = [20001; 20003; 20005; 20007; 20009];
x = [1; 1];
% Problem (a)
connum = cond(A'*A) % The condition number of A'A
% Problem (b)
xls = inv(A'*A)*A'*b
% Problem (c)
[m n] = size(A);
[q r] = qr(A);
xqr = inv(r(1:n, 1:n))*(q(:, 1:n)'*b)
% Problem (d)
Ain = inv(chol(A'*A)) * inv(chol(A'*A)');
xch = Ain*A'*b
% Problem (e)
xml = A\b
%Problem (f)
els = norm(x - xls,'fro')^2 % The error of the least-squares solution
eqr = norm(x - xqr,'fro')^2 % The error of the solution using the QR decomposition
echol = norm(x - xch,'fro')^2 % The error of the solution using the Cholesky factorization
eml = norm(x - xml,'fro')^2 % The error of the solution using the MATLAB backslash command