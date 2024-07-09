%Finding the optimal sampling time 
%We test this using Dirichlet boundary conditions

N = 500;
n_array = [100, 200, 300, 400];
n_index = 1;

T_array = [1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1, 10, 100, 1000, 10000];
T_disc_energy = zeros(4, 11);
T_cont_energy = zeros(4, 11);

%Construct A, C
A=dirichlet_0(N);
C=eye(N);

for n=n_array
  N_index = 1;

  B = (N^3)*eye(N);
  %n = n_array(index);
  B(n+1:end, n+1:end) = zeros(N-n, N-n);

  %Check controllability
  [~, ~, ~, ~, k] = ctrbf(A, B, C);

if sum(k)==N
    for T=T_array
        %Continuous case
        W_c = lyap(A, B*B');
        disc_val = norm(inv(sqrtm(W_c)))^2;
        T_cont_energy(n_index, N_index) = disc_val;

        %Discrete case
        [A_d, B_d] = c2d(A, B, T);
        W = dlyap(A_d, B_d*B_d');
        cont_val = norm(inv(sqrtm(W)))^2;
        T_disc_energy(n_index, N_index) = norm(inv(sqrtm(W)))^2;
        
        N_index=N_index+1;
    end
 else
     disp("Error: not controllable")
end
n_index = n_index+1;
end
T_diff_array = abs(T_cont_energy - T_disc_energy)./T_cont_energy;