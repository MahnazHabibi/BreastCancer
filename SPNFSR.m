
function [Score] = SPNFSR(k,N,W_initial,Alpha,Beta,X)
% k= fasele oghlidosi motmaen baraye similarity S (k=5)
% N=100;
%W_initial randomly between 0 to 1
% X= feature Matrix
[m,n]=size(X);
O(m,m)=0;
for i=1:m-1
    for j=i+1:m
        O(i,j)=sqrt(sum((X(i,:)-X(j,:)).^2));
        O(j,i)=O(i,j);
    end
end
%k=mean(mean(O))
for i=1:m
    for j=1:m
        if O(i,j)>k
            S(i,j)=0;
        else
            S(i,j)=exp(-(O(i,j)^2)/100);
        end
    end
end

for i=1:m
    R(i,i)=1;
end

for i=1:n
    Q(i,i)=1;
end
for i=1:m
    I(i,i)=1;
end


L=I-S-transpose(S)+(S*transpose(S));
M=transpose(X)*(L*X);
M1=(abs(M)+M)./2;
M2=(abs(M)-M)./2;
W=W_initial;
for i=1:N
    a=Alpha*M2*W+transpose(X)*R*X;
    b=(transpose(X)*R*X+Beta*Q+Alpha*M1)*W;
    W_New=W.*(a./b);
    [Q]=Construct_Q(W);
    [R]=Construct_R(W,X);
    W=W_New;
end
W=W';
W=W.^2;
Score=sqrt(sum(W));