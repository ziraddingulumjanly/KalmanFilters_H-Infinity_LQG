a_nominal = 0.2;
b_nominal = 1.2;
c_nominal = 0.5;
d_nominal = 0.1;

% Nominal transfer function G(s)
sys_nominal = tf([1 a_nominal], [1 b_nominal c_nominal d_nominal]);

% Bode plot for the nominal system
hf1 = figure;
bode(sys_nominal);
title('Bode Plot of the Nominal System', 'Interpreter', 'latex');
exportgraphics(hf1, 'bode_nominal_system.pdf', 'ContentType', 'vector');

% Step response for the nominal system
hf2 = figure;
step(sys_nominal);
title('Step Response of the Nominal System', 'Interpreter', 'latex');
exportgraphics(hf2, 'step_nominal_system.pdf', 'ContentType', 'vector');
