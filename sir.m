
function sir = sir(old_state,N)
sir = zeros(1,3);
for j = 1:N
          switch old_state(j)
            case -1
              sir(3) = sir(3)+1;
            case 0
              sir(1) = sir(1)+1;
            otherwise
              sir(2) = sir(2)+1;
           end;
end
