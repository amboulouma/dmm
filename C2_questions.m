%% C2. No reaction to outbreak
function P = C2_questions(P)

% Initial values and parameters
% Timeframe 
T = 100;
% Testing parameter
P.phi = 0;
% Initial value of capital
P.k0 = P.kss;
% initial value of infected
P.i0 = 0.01;
% Steady state of suceptible
P.sss = 1;

% Compute the equilibrium paths
[c,k,i,s,l] = compute_path(P,T);

% (a) plot in (k,c)-plane
figure('Name','Consumption by capital Trajectory plot');
plot_traj(P,k,c);

% (b) plot time paths
figure('Name','No reaction: Economic time paths');
plot_path(P,k,c,l,T);

figure('Name','No reaction: Labor and Epidemic time paths');
subplot(3,1,1);
plot(0:T,i);
title('share infected when phi = 0');
xlabel('time');
subplot(3,1,2);
plot(0:T,s);
title('share susceptible');
xlabel('time');
subplot(3,1,3);
plot(0:T,l);
title('Labor');
xlabel('time');
ylim([0,1]);

end
