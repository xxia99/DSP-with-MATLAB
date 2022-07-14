% Function harr.m
function w = haar(x, L)

    x=x';
    sj = sqrt(1/2) * (x(1:2:end) + x(2:2:end)); % Compute sJ-1
    wj = sqrt(1/2) * (x(1:2:end) - x(2:2:end)); % Compute wJ-1
    SJ = sj; % Stack sjn
    WJ = wj; % Stack wjn
    
    J = log2(length(x)); % Compute J
    for j = 1:J-1
        sj_1 = sqrt(1/2) * (sj(1:2:end) + sj(2:2:end)); % Compute sj-1 based on sj
        wj_1 = sqrt(1/2) * (sj(1:2:end) - sj(2:2:end)); % Compute wj-1 based on sj
        SJ = [sj_1 SJ]; 
        WJ = [wj_1 WJ];
        sj = sj_1; % Update sj with sj-1
    end
    
    S = SJ(2^(J-L):2^(J-L+1)-1); % Scaling coefficients at scale J-L
    W = WJ(2^(J-L):end); % Wavelet coefficients at scale J-L, J-L+1...
    w = [S W];
    
end