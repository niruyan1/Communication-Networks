%% Niruyan Rakulan 214343438 crc_decode function takes 1 input, 1 output EECS 3213
function [y]=crc_decode(x)
g=[1 0 1 0 0 1];
i=x;
quo=zeros(1,length(i)-length(g)+1);
%modulo-2 division continues until remainder(i) is found
while(length(i)>=length(g))
    %if the MSB in i is equal to 0, it is thrown away, and rest of the
    %division continues
    if(~i(1))
        i=i(2:end);
        continue;
    end
    %g1 is equal to g(x) with zeros appended to it inorder to have same
    %length as i(the current dividend)
    g1=[g,zeros(1,length(i)-length(g))];
    %modulo-2 addition
    i=xor(i,g1);
    %updates the quotient
    quo(length(quo)-(length(i)-length(g)))=1;
end
rem=i;
y=int32(any(rem));

end
