%% Niruyan Rakulan 214343438 part2 sim_multiple
function sim_multiple(p,j)
%initialize the numerors and numcaugth
numerrors=0;
numcaught=0;
%make j random 15 bit vectors
for i=1:j
%make random vector
    b=mod(randi(1000000,1,15),2);
%encode vector
    beo=crc_encode(b);
%flip bits in original encoded vector
    be=beo;
    for n=1:length(be)
        if(be(n)==0)
            be(n)=(rand(1)<p);
        else
            be(n)=(rand(1)>p);
        end
    end
%if flipped bits vector is different from orignal, error present. numerror
%incremented by 1
    if (~isequal(be,beo))
        numerrors=numerrors+1;
%if flipped bits vector is different from orignal, error present. numerror
%incremented stays the same
    else
        numerrors=numerrors;
    end
%numcaugth incremented by one if decoder caugth error
    numcaught=numcaught+crc_decode(be);
end
fprintf('Sequences with errors:%i\n',numerrors);
fprintf('Sequences with undetected errors:%i\n',numerrors-numcaught);

end