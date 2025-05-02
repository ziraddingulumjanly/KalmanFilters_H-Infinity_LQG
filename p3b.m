a_nominal = 0.2;
b_nominal = 1.2;
c_nominal = 0.5;
d_nominal = 0.1;

% Define extreme values
a_extreme = [a_nominal*0.93, a_nominal*1.07];   % Approximate extremes for a
b_extreme = [b_nominal*0.75, b_nominal*1.25];   % Approximate extremes for b
c_extreme = [c_nominal*0.99, c_nominal*1.01];   % Approximate extremes for c
d_extreme = [d_nominal*0.90, d_nominal*1.10];   % Approximate extremes for d

% All combinations of the extreme values
[a_grid, b_grid, c_grid, d_grid] = ndgrid(a_extreme, b_extreme, c_extreme, d_extreme);
extreme_values = [a_grid(:), b_grid(:), c_grid(:), d_grid(:)];

% Create the nominal transfer function G(s)
sys_nominal = tf([1 a_nominal], [1 b_nominal c_nominal d_nominal]);

% Plotting: Bode plot
hf1 = figure;
hold on;
bode(sys_nominal);  

for i = 1:size(extreme_values, 1)
    a = extreme_values(i, 1);
    b = extreme_values(i, 2);
    c = extreme_values(i, 3);
    d = extreme_values(i, 4);
    
    sys_extreme = tf([1 a], [1 b c d]); 
    bode(sys_extreme);
end

% Plot
legend('Nominal', 'Extreme models');
title('Bode Plot: Nominal vs Extreme Systems', 'Interpreter', 'latex');
grid on; box on;
exportgraphics(hf1, 'bode_nominal_vs_extreme_systems.pdf', 'ContentType', 'vector');
exportgraphics(hf1, 'bode_nominal_vs_extreme_systems.pdf', 'ContentType', 'vector');  

% Step response plot for all systems
hf2 = figure;
hold on;
step(sys_nominal);  

for i = 1:size(extreme_values, 1)
    a = extreme_values(i, 1);
    b = extreme_values(i, 2);
    c = extreme_values(i, 3);
    d = extreme_values(i, 4);
    
    % Create uncertain transfer function for the current extreme values
    sys_extreme = tf([1 a], [1 b c d]);
    
    % Plot step response for the extreme model
    step(sys_extreme);
end

% Plot
legend('Nominal', 'Extreme models');
title('Step Response: Nominal vs Extreme Systems', 'Interpreter', 'latex');
grid on; box on;
exportgraphics(hf2, 'step_nominal_vs_extreme_systems.pdf', 'ContentType', 'vector');
exportgraphics(hf2, 'step_nominal_vs_extreme_systems.pdf', 'ContentType', 'vector');  
