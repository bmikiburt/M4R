function A = periodic(N)
%Returns NxN matrix for perioidc boundary conditions
A = dirichlet_0(N);
A(N, 1) = (N^2); % Set the bottom left element to 1 * (Delta z^)2
A(1, N) = (N^2); % Set the top right element to 1 * (Delta z^)2
end