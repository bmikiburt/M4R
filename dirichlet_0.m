function A = dirichlet_0(N)
%Returns an NxN matrix for Dirichlet boundary conditions
%With boundary vertices fixed at 0
A = -2 * eye(N);
if N > 1
   A(1:N+1:end) = -2; % Main diagonal
   A(2:N+1:end) = 1;  % Superdiagonal
   A(N+1:N+1:end) = 1; % Subdiagonal
end 
%Multiply by the thermal constant and divide by (Delta z^)2
A = A*(N^2);
end