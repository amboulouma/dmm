%% C2. No reaction to outbreak
function P = C2_questions(P)

T = 100;
P.phi = 0;
P.k0 = P.kss;
P.i0 = 0.01;

P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);

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

% (c) report observations
%   short-term:  households anticipate that production and income will
%                decrease in the future; to smooth consumption over the
%                recessionary period, they immediately consume less and
%                save more, which increases the capital stock
%   medium-term: even though the higher capital allows more production,
%                due to quickly rising number of infections, labor supply
%                drops, so that less is produced => household income dreases
%                => less can be spent on consumption and savings => capital
%                stock eventually starts to decrease
%   long-term:   as the epidemic fades out, production increases again,
%                thereby increasing consumption and savings; it takes
%                economy ~80 periods to get back to steady state even
%                though epidemic already ends after 50 periods after about
%                80% of the population are infecte

end