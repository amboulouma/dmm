%% C5.

function P = C5_questions(P)
% (a) 

T = 200;
P.k0 = P.kss;
P.i0 = 0.01;

P.lambda = 0.2;
P.gamma = 0.01;

[c,k,i,s,l,phi,p] = compute_path_phi(P,T)

figure('Name','Lambda = 0.2, Gamma = 0.01: Economic time paths');
plot_path(P,k,c,l,T);

% (b)

figure('Name','Lambda = 0.2, Gamma = 0.01: Economic time paths');
subplot(2,1,1);
plot(0:T,i);
title('share infected');
xlabel('time');
subplot(2,1,2);
plot(0:T,s);
title('share susceptible');
xlabel('time');

% (c)

%figure('Name','Lambda = 0.2, Gamma = 0.01: Phi and p');
%subplot(2,1,1);
%plot(0:T,phi);
%title('phi');
%xlabel('time');
%subplot(2,1,2);
%plot(0:T,p);
%title('p');
%xlabel('time');

end