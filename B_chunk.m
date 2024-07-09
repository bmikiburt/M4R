function B = B_chunk(N, n)
%Returns B zero matrix with n N^2 entries, chosen to be  the first n 
%diagonal entries.

B=eye(N);
B(n+1:end, n+1:end) = zeros(N-n, N-n);
