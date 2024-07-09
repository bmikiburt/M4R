function B = B_middle(N, n)
%Returns NxN zero matrix B with the middle n diagonal values equal to N^2
%If N, n are not both even or both odd, the middle is shifted 1 towards the
%bottom right corner

B_diag=zeros(1, N);
midpoint=round(N/2);
start = midpoint - (floor(n/2)-1);
finish = midpoint + (round(n/2));
B_diag(start:finish)=N^2;
B=diag(B_diag);


