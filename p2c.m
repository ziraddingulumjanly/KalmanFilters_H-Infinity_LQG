sys = rss(6,3,2,"legacy");
G_original = sys(1:2, 2);  

% Closed-loop system
[K, CL, gamma] = hinfsyn(sys, 1, 1);  

% Bode plot: Original vs Closed-loop system
figure;
bode(G_original, 'b', CL, 'r');  % Blue for original, red for closed-loop
legend('Original System', 'Closed-Loop System');
title('Bode Plot: Original vs Closed-Loop', 'Interpreter', 'latex');

% Singular value plot: Original vs Closed-loop system
figure;
sigma(G_original, 'b', CL, 'r');  % Blue for original, red for closed-loop
legend('Original System', 'Closed-Loop System');
title('Singular Value Plot: Original vs Closed-Loop', 'Interpreter', 'latex');
