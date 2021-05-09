%% C2. No reaction to outbreak
function P = C2_questions(P)

T = 200;
P.phi = 0;
P.k0 = P.kss;
P.i0 = 0.01;
P.sss = 1;

[c,k,i,s,l] = compute_path(P,T);

% (a) plot in (k,c)-plane
figure('Name','No reaction: Trajectory plot');
plot_traj(P,k,c);

% (b) plot time paths
figure('Name','No reaction: Economic time paths');
plot_path(P,k,c,l,T);

figure('Name','No reaction: Labor and Epidemic time paths');
subplot(3,1,1);
plot(0:T,i);
title('share infected');
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

% (c)
% short term(<20 periods):
% medium-term effects (20–50 periods):
% long-term ef- fects (>50 periods):

end