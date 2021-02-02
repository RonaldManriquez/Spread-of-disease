function G1 = create_graph_rnd(N,d);

 G1 = zeros(N,N);
 for i = 1:(d*N/2)
 j = floor(N*rand)+1;
 k = floor(N*rand)+1;
 while (j==k)||(G1(j,k)==1)
 j = floor(N*rand)+1;
 k = floor(N*rand)+1;
 end;
 G1(j,k)=1;
 G1(k,j)=1;
 end;
 G1 = sparse(G1);
