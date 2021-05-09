function P = pars(P)
% defines the model parameters
% inputs: structure P
% output: P updated with parameter values

% Probability to recover for Infected individuals
P.pi_r = 0.15;
% Probability of a new infection between Infected and Susceptible 
P.pi_s = 0.6;
% The contact rate
P.lambda = 0.2;
% Asymptomatic share from the Infected individuals
P.a = 0.3;

P.beta = 1.04^(-1/52);

P.delta = 0.05;

P.alpha = 0.26;

P.sigma = 0.5;

P.F  = @(K,L) K.^P.alpha.*L.^(1-P.alpha);
P.FK = @(K,L) P.alpha*K.^(P.alpha-1).*L.^(1-P.alpha);
P.FL = @(K,L) (1-P.alpha)*K.^P.alpha.*L.^(-P.alpha);
if P.sigma == 1
    P.u = @(c) log(c);
else
    P.u = @(c) (c.^(1-1/P.sigma)-1)/(1-1/P.sigma);
end
P.du = @(c) c.^(-1/P.sigma);
P.duinv = @(c) c.^(-P.sigma);

end