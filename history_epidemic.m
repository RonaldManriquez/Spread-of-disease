function history = history_epidemic_better(Graph,N,tau,aa,delta)
%%Graph=adjacency matrix,N=nº vertices, b=infected rate, aa=nº initial randomly vertices for transmission
W = randperm(N,aa);%zeros(1,aa); Este vector asegura que no se repitan.
%for a = 1:aa 
%W(1,a) = randi(N);
%end
old_state = zeros(N,1); %Infected matrix, 1 represents infected
for a = 1:aa 
    old_state(W(1,a),1) = 1;
end
vector=old_state;
luk = sir(old_state,N);
history = luk;
new_state=zeros(N,1);
while (luk(2)>0)
    Prob_Inf = Graph*vector*tau;
    for i=1:N
        if old_state(i)==-1
            new_state(i)=-1;
        elseif old_state(i)==1
                sal=rand;
            if sal>delta
                new_state(i)=1;
            else
                new_state(i)=-1;
            end
        else
            if old_state(i)==0
                nat = rand;
                if (Prob_Inf(i) > nat)
                    new_state(i)=1;
                else
                    new_state(i)=0;
                end
            end
        end
   end
vector=transforma(new_state,N);
old_state=new_state;
luk = sir(old_state,N);
history(length(history(:,1))+1,:) = luk;
end
