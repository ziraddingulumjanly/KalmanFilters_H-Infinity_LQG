function simulate_lqg_pdf()
    clear; clc;

    % System matrices
    A = [0 1; -1 -0.5];
    B = [0; 2];
    C = [1 0];
    K = [2.7016 3.3227];        
    L = [1.4066; 0.9893];      

    % Noise variances
    R1 = 0.5^2;    
    R2 = 0.1^2;    

    % Initial condition: x0 and xhat0
    x0 = [1; 0];
    xhat0 = [0; 0];
    x_init = [x0; xhat0];

    % Time vector
    T = 50;
    tspan = linspace(0, T, 1000);

    % Simulate
    [t, X] = ode45(@(t,x) lqg_dynamics(t,x,A,B,C,K,L,R1,R2), tspan, x_init);
    x = X(:,1:2);
    xhat = X(:,3:4);
    u = - (xhat * K');

    %  State plot 
    hf1 = figure('Position',[100 100 800 600]); hf1.Color = 'w'; hold on;
    plot(t, x(:,1), 'b-', 'LineWidth',1.5, 'DisplayName','$x_1(t)$');
    plot(t, xhat(:,1), 'r-', 'LineWidth',1.5, 'DisplayName','$\hat{x}_1(t)$');
    xlabel('Time [s]', 'Interpreter','latex', 'FontSize',14);
    ylabel('State', 'Interpreter','latex', 'FontSize',14);
    legend('Interpreter','latex', 'FontSize',12, 'Location','best');
    title('True vs Estimated State', 'Interpreter','latex', 'FontSize',14);
    grid on; box on;
    exportgraphics(hf1, 'lqg-state-vs-estimate.pdf', 'ContentType','vector');

    %  Control input plot 
    hf2 = figure('Position',[130 130 800 600]); hf2.Color = 'w'; hold on;
    plot(t, u, 'g-', 'LineWidth',1.5, 'DisplayName','$u(t)$');
    xlabel('Time [s]', 'Interpreter','latex', 'FontSize',14);
    ylabel('Control Input', 'Interpreter','latex', 'FontSize',14);
    legend('Interpreter','latex', 'FontSize',12, 'Location','best');
    title('Control Signal', 'Interpreter','latex', 'FontSize',14);
    grid on; box on;
    exportgraphics(hf2, 'lqg-control-input.pdf', 'ContentType','vector');
end

function dx = lqg_dynamics(~, x, A, B, C, K, L, R1, R2)
    % States: [x; xhat]
    x_true = x(1:2);
    xhat   = x(3:4);

    % Noise
    v1 = sqrt(R1) * randn;
    v2 = sqrt(R2) * randn;

    % Measurement
    y = C * x_true + v2;
    u = -K * xhat;
   
    dx_true = A * x_true + B * u + [0; 0.5] * v1;
    dx_hat  = A * xhat   + B * u + L * (y - C * xhat);

    dx = [dx_true; dx_hat];
end
