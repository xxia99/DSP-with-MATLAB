% Functionihaar.m
function x = ihaar(w, L)

    J = log2(length(w)); % Compute J
    sj = w(1, 1:2^(J-L)); % sJ-L
    wj = w(2^(J-L)+1:2^(J-L+1)); % wJ-L    
    Index = 2^(J-L+1)+1; % The start index of wJ-L+1 in w
    
    g0 = [sqrt(1/2) sqrt(1/2)]; % Define g0
    g1 = [sqrt(1/2) -sqrt(1/2)]; % Define g1

    for i= 1:L-1        
        uj = conv(upsample(sj, 2), g0); % Compute u for sJ-L+i
        vj = conv(upsample(wj, 2), g1); % Compute v for wJ-L+i       
        sj = uj(1:end-1)+vj(1:end-1); % Compute sJ-L+i  
        wj = w(Index:Index+2^(J-L+i)-1); % Find wJ-L+i in w
        Index = Index + 2^(J-L+i); % Update the start index of wJ-L+i+1     
    end
    
    u = conv(upsample(sj, 2), g0); % Compute u for sJ
    v = conv(upsample(wj, 2), g1); % Compute v for wJ       
    x = u(1:end-1)+v(1:end-1); % Compute sJ=x

end