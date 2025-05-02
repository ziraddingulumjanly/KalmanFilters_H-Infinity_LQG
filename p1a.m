% System matrices
A = [0 1;
    -1 -0.5];
B = [0; 2];
C = [1 0];

% Controllability check
Ctrl = [B A*B];
rank_Ctrl = rank(Ctrl);
if rank_Ctrl == size(A,1)
    disp('System is Controllable.');
else
    disp('System is NOT Controllable.');
end

% Observability check
Obsv = [C; C*A];
rank_Obsv = rank(Obsv);
if rank_Obsv == size(A,1)
    disp('System is Observable.');
else
    disp('System is NOT Observable.');
end
