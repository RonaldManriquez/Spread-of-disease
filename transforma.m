function vector = transforma(old_state,N)
vector=zeros(N,1);
for i=1:N
    if old_state(i)==1
        vector(i)=1;
    end
end
