%Finding the optimal sampling time 
%We test this using Dirichlet boundary conditions

N = 500;
n_array = 100:100:500;
n_index = 1;

T = 10;
disc_energy = zeros(size(n_array));
cont_energy = zeros(size(n_array));

%Construct A, C
A=dirichlet_0(N);
C=eye(N);

for n=n_array
  
  B = (N^3)*eye(N);
  B(n+1:end, n+1:end) = zeros(N-n, N-n);

  %Check controllability
  [~, ~, ~, ~, k] = ctrbf(A, B, C);

if sum(k)==N
    for T=T_array
        %Continuous case
        W_c = lyap(A, B*B');
        disc_val = norm(inv(sqrtm(W_c)))^2;
        cont_energy(n_index) = disc_val;

        %Discrete case
        [A_d, B_d] = c2d(A, B, T);
        W = dlyap(A_d, B_d*B_d');
        cont_val = norm(inv(sqrtm(W)))^2;
        disc_energy(n_index) = cont_val;

    end
 else
     disp("Error: not controllable")
end
n_index = n_index+1;
end

relative_diff_array = abs(cont_energy-disc_energy)./cont_energy;

