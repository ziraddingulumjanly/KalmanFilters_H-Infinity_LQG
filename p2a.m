rng(3242)
sys = rss(6,3,2,"legacy");
G = sys(1:2, 2);  

% Compute H-infinity norm
[hinf_norm, freq] = hinfnorm(G);

fprintf('H-infinity norm: %.4f\n', hinf_norm);
fprintf('Achieved at frequency: %.4f rad/s\n', freq);
