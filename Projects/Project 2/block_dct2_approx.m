function xm = block_dct2_approx(X,M)
    C = block_dct2(X);
    w = max(size(X));
    N = 8;
    w1 = w / N;
    for ii=1:w1
        for jj=1:w1
            x=C{ii,jj};
            x1=x(jpgzzind(N,N));
            xr=zeros(N,N);
            for iii=(M+1):(N*N)
                x(iii,1)=0;
            end
            for i=1:(N*N)
                for j=1:N
                    for k=1:N
                        if x(j,k)==x1(i,1)
                           xr(j,k)=x1(i,1);
                        end
                    end
                end
            end
            C{ii,jj}=xr;
        end
    end
    xm=iblock_dct2(C);
end