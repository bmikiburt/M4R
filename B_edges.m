function B = B_edges(N, n)
%Returns B zero matrix with n N^2 entries, chosen to be  the first n/2 
%diagonal entries and the last n/2 diagonal enties. 
%If n is odd, the extra entry is joined onto the last N^2 entries.

B_diag=zeros(1, N);
first_half = floor(n/2);
second_half = round(n/2)-1;
B_diag(1:first_half)=N^2;
B_diag(N-second_half:end)=N^2;
B=diag(B_diag);