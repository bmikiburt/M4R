function B = B_uniform_for_periodic(N, n)
%Returns B zero matrix with n N^2 entries evenly spread apart 
%along the lead diagonal such that the top left and bottom right corners
%are N^2.

B_diag = zeros(1, N);
start = round(N/n);
indices = round(linspace(start, N, n));
B_diag(indices) = N^2;
B=diag(B_diag);