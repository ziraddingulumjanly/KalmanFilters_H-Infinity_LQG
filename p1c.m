% System matrices
A = [0 1;
    -1 -0.5];
B = [0; 2];
C = [1 0];

G = [0; 0.5];  
D = 0;
H = 0;

% Create state-space model with process noise as additional input
sys = ss(A, [B G], C, [D H]);

% Noise covariances
Qn = 0.5^2;    
Rn = 0.1^2;    

% Design steady-state Kalman filter
[kalmf, L, P] = kalman(sys, Qn, Rn);
disp('Kalman gain L:');
disp(L);
