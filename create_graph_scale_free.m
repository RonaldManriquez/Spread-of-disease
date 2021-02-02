function G2 = create_graph_scale_free(N,d)
G2 = zeros(N,N);
placed = zeros(N,1);
for i = 1:(d+1)
  for j = (i+1):(d+1)
    G2(i,j) = 1;
    G2(j,i) = 1;
    end;
  placed(i) = 1;
  end;
for i = (d+2):N
  for l = 1:(d/2)
prob = (G2*placed).*placed.*(ones(N,1)-G2(:,i)); prob = prob/(ones(1,N)*prob);
s = rand;
m = 1;
while (s>prob(m)) s = s-prob(m); m=m+1;
end;
  G2(m,i) = 1;
  G2(i,m) = 1;
  end;
placed(i) = 1;
end;
G2 = sparse(G2);
