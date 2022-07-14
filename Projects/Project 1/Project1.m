load hw_gramschmidt
[N,K]=size(A);
x=A(:,1);
B=zeros(N,K);
Q=zeros(N,K);
B(:,1)=x;
for i=2:K
    a=A(:,i);
    b=a;
    for j=1:i-1
        b=b-(dot(a,B(:,j))/dot(B(:,j),B(:,j))*B(:,j));
    end
    B(:,i)=b;
end
for i=1:K
    Q(:,i)=B(:,i)/norm(B(:,i));
end
disp(rank([A Q]));
disp(max(max(abs(eye(50)-Q'*Q))))
