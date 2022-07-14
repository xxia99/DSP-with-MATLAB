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