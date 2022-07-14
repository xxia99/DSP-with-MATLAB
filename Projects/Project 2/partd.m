load jpeg_Qtable;
x=double(imread('frog.tiff'));
A=block_dct2(x); % Divide x into 8x8 blocks and conduct dct to each block
NC=length(A);
Nnonzero=0;
for i=1:NC
    for j=NC
        A{i,j}=Q.*round(A{i,j}./Q);
        Nnonzero=Nnonzero+sum(sum(A{i,j}));
    end
end
% Quantize the coefficients in each block of A using Q-table
Nnonzero % Show how many of the resulting coefficients are non-zero

xq=iblock_dct2(A);
error=log10(norm(x-xq,'fro')^2/norm(x,'fro')^2)
% Conduct idct and get the reconstructed image xq
% Compute the error between the original image and reconstructed one

dis1=norm(cell2mat(block_dct2(xq))-cell2mat(block_dct2(x)),'fro');
dis2=norm(xq-x,'fro');
error_verify=dis1-dis2
% Verify the Parseval theorem

imagesc(xq)
title('Reconstructed Image')
% Show the reconstructed image