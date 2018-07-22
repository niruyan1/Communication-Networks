%% Niruyan Rakulan 214343438 part 1 dijkstra
%% part 1
function [v,c]=	dijkstra(A,o,d)
%set of nodes 'N'
N=[o];
%initialize cost
c=0;
%initialize v
v=[o];
%length of square matrix
sizemats=size(A,1);
%Dijkstra table with costs
mcost=inf(sizemats);
%Dijkstra table with last hop
mfrom=inf(sizemats);
%iteration 0
for count=1:sizemats
    if((A(o,count)~=0)&&count~=o)
        %assign costs to neighbors of origin
        mcost(1,count)=A(o,count);
        mfrom(1,count)=o;
    end
end
% print for 0th iteration
%print iteration 0
mcost(1,o)=0;
mfrom(1,o)=o;
fprintf("Iteration:%d N=%i ",0,N);
for countprintcol=1:sizemats
    fprintf("%d,%d ",mcost(1,countprintcol),mfrom(1,countprintcol));
end
fprintf("\n");
mcost(1,o)=inf;
mfrom(1,o)=inf;

%update N to include node of lowest cost
[minscost,indexofmin]=min(mcost(1,:));
N=[N,indexofmin(1)];

%iterations 1 to sizeofmatrix-1
for iter=2:sizemats
    fprintf("Iteration:%d N=",iter-1);
    fprintf("%i",N);
    n=N(iter);
    for i=1:sizemats
        %update values to table if newest node has lower cost and enusre
        %column under the nodes already in N is infiniti
        qw=A(n,i)+min(mcost(:,n));
        if(A(n,i)~=0&& qw<mcost(iter-1,i)&&~ismember(i,N))
            mcost(iter,i)=A(n,i)+min(mcost(:,n));
            mfrom(iter,i)=n;
        else
            %keep old values in table
            if(~ismember(i,N))
                mcost(iter,i)= mcost(iter-1,i);
                mfrom(iter,i)=mfrom(iter-1,i);
            end
        end
    end
    %update N to include node with lowest cost
    [m,i]=min(mcost(iter,:));
    if(~ismember(i,N))
        N=[N,i(1)];
    end
    %print step
    for countprintcol=1:sizemats
        fprintf(" %d,%d ",mcost(iter,countprintcol),mfrom(iter,countprintcol));
    end
    fprintf("\n");
end

%include cost and last hop for origin on table
mcost(1,o)=0;
mfrom(1,o)=o;

%initialize array; goes from destination to origin
sequence=[d];
%current node; being at destination
cnode=d;
%index of cost and last hop for current node; should be equal on both
%tables
index=sizemats;

%while current node is not origin
while cnode~=o
    %find the value of cost and hop that is located at the bottom of
    %table for each column(not infiniti)
    for x=1:sizemats
        if (mcost(x,cnode)~=inf)
            index=x;
        end
    end
    %get new current node
    cnode=mfrom(index,cnode);
    %add new node to sequence
    sequence=[sequence,cnode];
    
end
%flip sequence to go from origin to destiantion
v=fliplr(sequence);
[c,asdfg]=min(mcost(:,d));
end