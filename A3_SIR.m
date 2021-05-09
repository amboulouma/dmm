function P = A3_SIR(P) 

%initials 
R0 = 0; %recovered population
I0 = 0.01; %infected population
S0 = 1 - I0; %susceptible population

%length of time to run simulation over
T = 100;

for phi=[0, 1/3, 2/3, 1]
    P = SIR(I0, S0, P, T, phi);
    result = [phi, P.max_I, P.max_I_T];
    figure();
end
