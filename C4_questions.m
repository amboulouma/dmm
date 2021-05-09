%% C4. 
function P = C4_questions(P)

T = 100;
P.k0 = P.kss;
P.i0 = 0.01;

% (a) analysis for lambda = 0.4
P.lambda = 0.4;

P.phi = 0;
P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);
[c,k,i,s,l] = compute_path(P,T);

figure('Name','No reaction: Economic time paths');
plot_path(P,k,c,l,T);

P.phi = 1/3;
P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);
[c,k,i,s,l] = compute_path(P,T);

figure('Name','No reaction: Economic time paths');
plot_path(P,k,c,l,T);



% compare to C2
%   short-term:  initially, consumption drops more as containment measures
%                (consumption taxes) are very high in the beginning 
%                this spurs savings and leads to a faster short-term
%                increase in capital
%   medium-term: the maximum drop in consumption is less because the rising
%                capital partly offsets the shrinking labor supply
%                as a result of higher savings both in the short and in the
%                medium term, the capital stock drops less
%   long-term:   the recovery is faster because capital did not drop as
%                much at the peak of the recession

% (b) optimal value of b

% to maximize household utility, b should be set to approximately 0.05
% the optimal policy from C3 attains higher household utility and should be
% prefered

% (c)

T = 150;
P.phi = 1;
P.sss = P.pi_r/P.pi_s*(P.lambda + (1 - P.lambda)*(1 - P.phi)*P.a)^(-1);
[c,k,i,s,l] = compute_path(P,T);

figure('Name','No reaction: Trajectory plot');
plot_traj(P,k,c);

figure('Name','No reaction: Economic time paths');
plot_path(P,k,c,l,T);

figure('Name','No reaction: Labor and Epidemic time paths');
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
figure('Name','Household utility depending on phi');
plot(phigrid,Ugrid);
xlabel('phi');
ylabel('household utility U(c*)');

[Umax,imax] = max(Ugrid);
P.phi_max = phigrid(imax);
fprintf('phi_max = %4.4f\tUmax = %4.6f\n',P.phi_max,Umax);

end