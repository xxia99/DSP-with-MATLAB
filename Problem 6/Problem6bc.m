for i=1:3
    B = randn(10^i, 10^i);
    A = B + B';
    [E,numit]=compe(A);
    [V, L] = eig(A);
    disp(['N = ',num2str(10^i)])
    numit; % Number of iterations:
    lva=E; % The estimated-largest eigenvalue
    ratio = L(1,1) / L(2,2) % Ratio of Lambda1 / Lambda2
    lvm=L(1,1); % The MATLAB-compute-largest eigenvalue
    err=norm(lva - lvm,'fro'); % The estimate error
end