%% Niruyan Rakulan 214343438 part2 sim_isngle
function sim_single(p,x)
disp('Original encoded vector');
y=crc_encode(x);
%modified encoded vector; bits are flipped
b=y;
fprintf('%i',y);
fprintf('\n');
%bits flipped
for n=1:length(b)
    if(b(n)==0)
        b(n)=(rand(1)<p);
    else
        b(n)=(rand(1)>p);
    end
end
%displays output
disp('Encoded vector with bit flips');
fprintf('%i',b);
fprintf('\n');
%if modified encoded vecotr has bits flipped, error present
if (~isequal(b,y))
    disp('Errors present:YES');
else
%if modified encoded vector does not have bits flipped, error not present
    disp('Errors present:NO');
end
decodb=crc_decode(b);
if(decodb==1)
%if decode detected error
    disp('CRC detects errors:YES');
else
%if decode didnt detect error
    disp('CRC detects errors:NO');  
end
end
