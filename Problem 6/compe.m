function [E,numit] =compe(A)
    numit = 0;
    qr = randn(length(A), 1);
    qk = qr / norm(qr);
    gn = qk'*A*qk;
    while true
        numit = numit + 1;
        qk = (A*qk) / norm(A*qk);
        go = gn;
        gn = qk'*A*qk;
        if abs(gn-go) <= eps
            break;
        end
    end
    E=gn;
end