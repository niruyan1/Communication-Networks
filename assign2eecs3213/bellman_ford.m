%% Niruyan Rakulan 214343438 part2 bellman ford
%%
function [v, c]=bellman_ford(A,o,d);
c=0;
v=[o];
%length of square matrix
sizemats=size(A,1);
%table with costs
mcost=inf(1,sizemats);
%table with last hop
mfrom=inf(1,sizemats);
%initilaize cost an last hop for origin node
mcost(1,o)=0;
mfrom(1,o)=o;
%array with known nodes
N=o;
%go to second row
iter=2;
for countprintcol=1:sizemats
    fprintf("%d,%d ",mcost(1,countprintcol),mfrom(1,countprintcol));
end
fprintf("\n");
while(1)
    %initialize next row
    mcost=[mcost;mcost(iter-1,:)];
    mfrom=[mfrom;mfrom(iter-1,:)];
    %loop through known nodes and find lowest cost path
    for x=N
        for i=1:sizemats
            %find nodes that are connected to known nodes
            if(A(x,i)~=0&&~ismember(i,N))
                N=[N,i];
            end
            %if new cost lower than old cost, replace it
            qw=A(x,i)+min(mcost(:,x));
            if(A(x,i)~=0&&qw<mcost(iter-1,i))
                mcost(iter,i)=A(x,i)+min(mcost(:,x));
                mfrom(iter,i)=x;
            end
        end
    end
    
    %if last 2 rows are equal, break
    for countprintcol=1:sizemats
        fprintf("%d,%d ",mcost(iter,countprintcol),mfrom(iter,countprintcol));
    end
    fprintf("\n");
    if(isequal(mcost(iter,:),mcost(iter-1,:)))
        break;
    end
    iter=iter+1;
    
end
%initialize array; goes from destination to origin
sequence=[d];
%current node; being at destination
cnode=d;
%index of cost and last hop for current node; should be equal on both
%tables
index=sizemats;

%while current node is not origin
while cnode~=o
    cnode=mfrom(end,cnode);
    %add new node to sequence
    sequence=[sequence,cnode];
    
end
%flip sequence to go from origin to destiantion
v=fliplr(sequence);
%get cost from table
[c,asdfg]=min(mcost(:,d));

end