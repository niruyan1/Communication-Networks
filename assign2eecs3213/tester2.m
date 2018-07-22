%% part 1
close all;
clear all;
clc;
A=[0 3 2 5 0 0; 3 0 0 1 4 0; 2 0 0 2 0 1; 5 1 2 0 3 0; 0 4 0 3 0 2;0 0 1 0 2 0];
o=4;
d=6;
[v,c]=dijkstra(A,o,d);
%% part 2
close all;
clear all;
clc;
A=[0 3 2 5 0 0; 3 0 0 1 4 0; 2 0 0 2 0 1; 5 1 2 0 3 0; 0 4 0 3 0 2;0 0 1 0 2 0];
o=4;
d=6;
[v1,c1]=bellman_ford(A,o,d);

%% part 3
close all;
clear all;
clc;
A=[0 3 2 5 0 0; 3 0 0 1 4 0; 2 0 0 2 0 1; 5 1 2 0 3 0; 0 4 0 3 0 2;0 0 1 0 2 0];
o=4;
[v1,c1]=dijkstra_p3(A,o);

%% part 4
close all;
clear all;
clc;
A=[0 3 2 5 0 0; 3 0 0 1 4 0; 2 0 0 2 0 1; 5 1 2 0 3 0; 0 4 0 3 0 2;0 0 1 0 2 0];
o=4;
[v1,c1]=bellman_ford_p3(A,o);