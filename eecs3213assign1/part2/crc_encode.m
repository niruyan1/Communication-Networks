%% Niruyan Rakulan 214343438 crc_encode function takes 1 input, 1 output EECS 3213
function [y]=crc_encode(x)
%g(x)
g=[1 0 1 0 0 1];
%i(x)*x^(n-k)
ix=[x,zeros(1,length(g)-1)];
%i;changes through program to represent the new dividend
i=ix;

%initialize quotient; having degree equal to the difference of degrees
%between dividend and divisor
quo=zeros(1,length(i)-length(g)+1);

%modulo-2 division continues until remainder(i) is found
while(length(i)>=length(g))
    %if the MSB in i is equal to 0, it is thrown away, and rest of the
    %division continues
    if(i(1)==0)
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
while(i(1)==0)
    i=i(2:end);
    if(length(i)==0);
        break;
    end
end
%length of quotientmultiplied by x^(n-k)
quo=[quo,zeros(1,length(x)-length(g))];
%length of remiander made equal to quotient by appending zeros
rem=[zeros(1,length(ix)-length(i)),i];
%addition betwen quotient and remainder
y=int8(xor(ix,rem));
end