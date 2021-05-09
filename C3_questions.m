%% C3. 
function P = C3_questions(P)

T = 200;
P.k0 = P.kss;
P.i0 = 0.01;
% Fixed share of government
P.phi = 1/3;
P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);

[c,k,i,s,l] = compute_path(P,T);

% C3(a) Equilibrium time paths of consumption, capital and labor relative to C2
figure('Name','Phi = 1/3: Trajectory plot');
plot_traj(P,k,c);

figure('Name','Phi = 1/3: Economic time paths');
plot_path(P,k,c,l,T);

figure('Name','Phi = 1/3: Labor and Epidemic time paths');
subplot(2,1,1);
plot(0:T,i);
title('share infected');
xlabel('time');
subplot(2,1,2);
plot(0:T,s);
title('share susceptible');
xlabel('time');


% C3(b) Obtaining the equilibrium path and computing household utility

T = 200;
P.phi = 1;
P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);
[c,k,i,s,l] = compute_path(P,T);

figure('Name','Phi = 1: Trajectory plot');
plot_traj(P,k,c);

figure('Name','Phi = 1: Economic time paths');
plot_path(P,k,c,l,T);

figure('Name','Phi = 1 : Labor and Epidemic time paths');
subplot(2,1,1);
plot(0:T,i);
title('share infected');
xlabel('time');
subplot(2,1,2);
plot(0:T,s);
title('share susceptible');
xlabel('time');

ngrid = 200;
phigrid = linspace(0,1,ngrid);
Ugrid = nan(size(phigrid));
for j=1:ngrid
    P.phi = phigrid(j);
    [c,k,i,s,l] = compute_path(P,T);
    Ugrid(j) = sum(P.beta.^(0:T).*P.u(c)) + ((P.beta^(T+1))/(1-P.beta))*P.u(P.css);
end
figure('Name','Household utility depending on phi');
plot(phigrid,Ugrid);
xlabel('phi');
ylabel('household utility U(c*)');

[Umax,imax] = max(Ugrid);
P.phi_max = phigrid(imax);
fprintf('phi_max = %4.4f\tUmax = %4.6f\n',P.phi_max,Umax);

end

% Phi max = 
