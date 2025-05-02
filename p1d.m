% System matrices
A = [0 1; -1 -0.5];
B = [0; 2];
C = [1 0];

K = [2.7016 3.3227]; % LQR gain from part (b)
L = [1.4066; 0.9893]; % Kalman gain from part (c)

% Closed-loop augmented system matrix
A_LQG = [A        -B*K;
         L*C  (A - B*K - L*C)];

disp('Closed-loop LQG system matrix A_LQG:');
disp(A_LQG);
