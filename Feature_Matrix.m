function[Normal_Features]=Feature_Matrix(Gene)
l=length(Gene);
Adj(l,l)=0;
for i=1:l-1
    for j=i+1:l
        A=Gene(i).CaseID;
        B=Gene(j).CaseID;
        a=length(A);
        b=length(B);
        n=min([a,b]);
        if a>0
            if b>0
                Adj(i,j)=length(intersect(A,B))/n;
                Adj(j,i)=Adj(i,j);
            end
        end
    end
end
G = digraph(Adj);
G1 = graph(Adj);
Weight=sum(Adj);
PageRank = centrality(G, 'pagerank','Importance',G.Edges.Weight);
closeness= centrality(G,'outcloseness','Cost',G.Edges.Weight);
betweenness_Cost = centrality(G,'betweenness','Cost',G.Edges.Weight);
Eigenvector_Importance=centrality(G1,'eigenvector','Importance',G1.Edges.Weight);
[Entropy] = Graph_Entropy(Adj);
A2=Adj;
for i=1:l
L=setdiff([1:l],i);
A2=Adj(L,L);
e=Graph_Entropy(A2);
E(i,1)=abs(Entropy-e);
end
%%%%%%%%%%%%%% Tpological_Features %%%%%%%%%%%%%
Feature(:,1)=Weight';
Feature(:,2)=closeness;
Feature(:,3)=betweenness_Cost;
Feature(:,4)=PageRank;
Feature(:,5)=Eigenvector_Importance;
Feature(:,6)=E;
%%%%%%%%%%%%%%% Biological_Features %%%%%%%%%%%%%%
l=597;
for i=1:l
Feature(i,7)=mean(Gene(i).SNV);
Feature(i,8)=mean(Gene(i).CNV);
end
[Normal_Features]=Normal_matrix(Feature);