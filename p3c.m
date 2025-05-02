a_nominal = 0.2;
b_nominal = 1.2;
c_nominal = 0.5;
d_nominal = 0.1;

% Define extreme values for uncertain parameters
a_extreme = [a_nominal*0.93, a_nominal*1.07];
b_extreme = [b_nominal*0.75, b_nominal*1.25];
c_extreme = [c_nominal*0.99, c_nominal*1.01];
d_extreme = [d_nominal*0.90, d_nominal*1.10];

% Generate all combinations
[a_grid, b_grid, c_grid, d_grid] = ndgrid(a_extreme, b_extreme, c_extreme, d_extreme);
extreme_values = [a_grid(:), b_grid(:), c_grid(:), d_grid(:)];
num_random_samples = 100;

hf = figure;
hold on;

% Plot the extreme systems from Part (b)
for i = 1:size(extreme_values, 1)
    a = extreme_values(i, 1);
    b = extreme_values(i, 2);
    c = extreme_values(i, 3);
    d = extreme_values(i, 4);
    
    sys_extreme = tf([1 a], [1 b c d]);    
    step(sys_extreme);
end

% Generate/plot 100 random instances of the uncertain system
for i = 1:num_random_samples
    a_rand = (max(a_extreme) - min(a_extreme)) * rand(1) + min(a_extreme);
    b_rand = (max(b_extreme) - min(b_extreme)) * rand(1) + min(b_extreme);
    c_rand = (max(c_extreme) - min(c_extreme)) * rand(1) + min(c_extreme);
    d_rand = (max(d_extreme) - min(d_extreme)) * rand(1) + min(d_extreme);
    
    % Create uncertain transfer function for the current random values
    sys_random = tf([1 a_rand], [1 b_rand c_rand d_rand]);        
    step(sys_random);
end

% Plot nominal model step response
sys_nominal = tf([1 a_nominal], [1 b_nominal c_nominal d_nominal]);
step(sys_nominal);  

% Plot
legend('Extreme models', 'Random instances', 'Nominal model', 'Location', 'best');
title('Step Response: Extreme vs Random vs Nominal Systems', 'Interpreter', 'latex');
grid on; box on;
exportgraphics(hf, 'final.pdf', 'ContentType', 'vector');
