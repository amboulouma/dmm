%% C4. Uncertainty about the willingness of symptomatic and identified asymtomatic individuals to reduce their contacts
function P = C4_questions(P)

T = 200;
P.k0 = P.kss;
P.i0 = 0.01;

% C4(a) Checking the robustness by analysis for lambda = 0.4
P.lambda = 0.4;

P.phi = 0;
P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);
[c,k,i,s,l] = compute_path(P,T);

% Plotting and comparing the equilibrium time paths of consumption, capital and labor

figure('Name','Phi = 0, Lambda = 0.4: Trajectory plot');
plot_traj(P,k,c);
figure('Name','Phi = 0, Lambda = 0.4: Economic time paths');
plot_path(P,k,c,l,T);

P.phi = 1/3;
P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);
[c,k,i,s,l] = compute_path(P,T);

figure('Name','Phi = 1/3, Lambda = 0.4: Trajectory plot');
plot_traj(P,k,c);
figure('Name','Phi = 1/3, Lambda = 0.4: Economic time paths');
plot_path(P,k,c,l,T);

T = 200;
P.phi = 1;
P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);
[c,k,i,s,l] = compute_path(P,T);

figure('Name','Phi = 1, Lambda = 0.4: Trajectory plot');
plot_traj(P,k,c);

figure('Name','Phi = 1, Lambda = 0.4: Economic time paths');
plot_path(P,k,c,l,T);

figure('Name','Phi = 1, Lambda = 0.4: Labor and Epidemic time paths');
subplot(2,1,1);
plot(0:T,i);
title('share infected');
xlabel('time');
subplot(2,1,2);
plot(0:T,s);
title('share susceptible');
xlabel('time');

ngrid = 150;
phigrid = linspace(0,1,ngrid);
Ugrid = nan(size(phigrid));
for j=1:ngrid
    P.phi = phigrid(j);
    [c,k,i,s,l] = compute_path(P,T);
    Ugrid(j) = sum(P.beta.^(0:T).*P.u(c)) + P.beta^(T+1)/(1-P.beta)*P.u(P.css);
end
figure('Name','Household utility depending - phi from 0 to 1');
plot(phigrid,Ugrid);
xlabel('phi');
ylabel('household utility U(c*)');

[Umax,imax] = max(Ugrid);
P.phi_max = phigrid(imax);
fprintf('phi_max = %4.4f\tUmax = %4.4f\n',P.phi_max,Umax);

end
