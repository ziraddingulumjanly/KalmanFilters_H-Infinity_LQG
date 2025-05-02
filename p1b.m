% System matrices
A = [0 1;
    -1 -0.5];
B = [0; 2];

Q = eye(2);      % State penalty
rho = 0.1;
R = rho;         % Control penalty

% LQR gain
[K, S, e] = lqr(A, B, Q, R);

% Output results
disp('LQR gain K:');
disp(K);

disp('Closed-loop poles:');
disp(e);
