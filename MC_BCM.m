function [Clusters] = MC_BCM(PPI,T_low,T,k,N)
%T_low=0.02
%T=1000
%PPI:Adj Matrix in Breast Cancer Network
%k: the size of modules
%N: the number of clusters of size N with maximum density
for n=1:N
X=fix(rand(1,k).*1193.+1);

F1=sum(sum(PPI(X,X)));
while T>T_low
    n=length(X);
    i=fix(n*rand(1)+1);
    if i>n
        i=n;
    elseif i==0
        i=1;
    end
    X1=setdiff(X,X(i));
    A=sum(PPI(X1,:));
    N=setdiff(find(A>0),X1);
    l=length(N);
    if l>0
    j=fix(l*rand(1)+1);
    if j>l
        j=l;
    elseif j==0
        j=1;
    end
        
    X_New=union(X1,N(j));
    F2=sum(sum(PPI(X_New,X_New)));
    if F2>F1
        X=X_New;
        F1=F2;
    else
        x=rand(1);
        if x<exp((F2-F1)/T)
           X=X_New;
           F1=F2;
        end
    end
    end
    T=T*0.9;
end
Clusters(n).clusters=X;
end
    