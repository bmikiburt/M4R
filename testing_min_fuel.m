function fuel_array=testing_min_fuel(B_func, bc_func, N, n_array, T)
% e.g. testing_min_fuel(@B_chunk, @dirichlet_0, 500, 10:10:500, 10)
%Retruns the squared spectral norm ||W^{-1/2}||_2^2 where W is the discrete
%time controllability Gramian for the discretised system (A_d, B_d) of
%(A,B)
%Args:
%B_func : function to generate B (continuous time) from input N
%bc_func : function to generate A (continuous time) from input N
%N : int, size of the system
%n_array: array, values of n to investigate (no. of nonzero entries of B)
%T: float, the sampling time 

n_index = 1;
fuel_array = zeros(size(n_array));

%Construct A, C
A=bc_func(N);
C=eye(N);

for n=n_array
  %Construct B
  B = B_func(N, n);

  %Check controllability
  [~, ~, ~, ~, k] = ctrbf(A, B, C);

if sum(k)==N
    [A_d, B_d] = c2d(A, B, T);
    W = dlyap(A_d, B_d*B_d');
    disc_val = norm(inv(sqrtm(W)))^2;
    fuel_array(n_index) = disc_val;
 else
     disp(["Error: not controllable for n=", n])
end
n_index = n_index+1;
end

