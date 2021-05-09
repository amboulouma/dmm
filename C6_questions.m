%% C6. Verifying the gamma from C5 to checl is it achieve close to the value of highest level of welfare.



%% Defining a grid for gamma from 0 to 0.02.



%% Obtaining the equilibrium path and computing household utility as C3(b).



%% Plotting the utility levels as a function of gamma.

function P = C5_questions(P)

T = 200;
P.phi = 1;
P.k0 = P.kss;

P.lambda = 0.2;
P.gamma = 0.01;
P.i0 = 0.01;
P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);
[c,k,i,s,l,phi,p] = compute_path_phi(P,T)

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
