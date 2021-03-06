%% Niruyan Rakulan 214343438 part 3 bellmanford
%% part 3
function [V,c]=bellman_ford_p3(A,o)
%get size of matrix
sizemats=size(A,1);
%intialize vectors
V=zeros(sizemats);
c=zeros(1,sizemats);
%get costs and sequence for each destination
for count=1:sizemats
    [vget,cget]=bellman_ford(A,o,count);
    clc;
    V(count,:)=[vget,zeros(1,sizemats-length(vget))];
    c(count)=cget;
end
end