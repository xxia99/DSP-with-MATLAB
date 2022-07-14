% The code below is used to divide the given image into 8x8 blocks
% and coefficients of each block are calculated and store in cell C.
function C= block_dct2(x)
    w = max(size(x));
    N = 8;
    w1 = w / N;
    C=mat2cell(x, N*ones(1, w1), N*ones(1, w1));
    for i=1:w1
        for j=1:w1
            C{i,j}=dct2(C{i,j}); 
        end
    end
end
% When given coefficients which are contained in cell C
% we can use the code below to return the image.
function R = iblock_dct2(C)
    [m,n]=size(C);
    for i=1:m
        for j=1:n
            C{i,j}=idct2(C{i,j});
        end
    end
    R=cell2mat(C);
    R=rescale(R);
end