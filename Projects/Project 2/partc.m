x=double(imread('frog.tiff'));
M=linspace(1,64,64);
numM=length(M);
fm=zeros(1,numM);

for i=1:numM
    xm=block_dct2_approx(x,i);
    fm(1,i)=log10(norm(x-xm,'fro')^2/norm(x,'fro')^2);
end
plot(M,fm)
% Conduct approximation for each M in the range, compute the
% corresponding error and plot the figure


imagesc(block_dct2_approx(x, 8))
title('M = 1')
imagesc(block_dct2_approx(x, 3))
title('M = 3')
imagesc(block_dct2_approx(x, 8))
title('M = 8')
% Show the the approximation for M = 1, 3, 8