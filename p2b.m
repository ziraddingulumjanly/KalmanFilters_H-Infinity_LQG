rng(3242)
sys = rss(6,3,2,"legacy");

ncont = 1;   
nmeas = 1;   

% Apply hinfsyn
[K, CL, gamma] = hinfsyn(sys, nmeas, ncont);

% Compute H-infinity norm of closed-loop system
[hinf_CL, peakFreq] = hinfnorm(CL);
fprintf('Achieved gamma value: %.4f\n', gamma);
fprintf('H-infinity norm of closed-loop: %.4f (peak at %.4f rad/s)\n', hinf_CL, peakFreq);
