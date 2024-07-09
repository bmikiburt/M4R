function c_energy_array = testing_B_constant(bc_func, N_array, c)
%Testing the appropriate constant to multiply B by
%We test this using Dirichlet boundary conditions

%We scan across N=20 to N=1000
c_energy_array = zeros(size(N_array));
index=1;

for N=N_array
   %Construct A, B, C
   B = c*eye(N);
   A=bc_func(N);
   C=eye(N);

   %Check controllability using the continuous system
   [~, ~, ~, ~, k] = ctrbf(A, B, C);
    
   if sum(k)==N
        [A_d, B_d] = c2d(A, B, T);
        W = dlyap(A_d, B_d*B_d');
        c_energy_array(index) = norm(inv(sqrtm(W)))^2;
    else
        disp("Error: not controllable")
        break
   end
   index = index+1;
end