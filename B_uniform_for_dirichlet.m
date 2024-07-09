function B = B_uniform_for_dirichlet(N, n)
%Returns B zero matrix with n N^2 entries evenly spread apart 
%along the lead diagonal such that the top left and bottom right corners
%are N^2.

B_diag = zeros(1, N);
indices = round(linspace(1, N, n));
B_diag(1, indices) = N^2;
B=diag(B_diag);