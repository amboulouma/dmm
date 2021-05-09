function plot_path(P,k,c,l,T)
% plot steady state and trajectory in the (k,c) plane
% inputs: S ... parameters and steady state
%         k ... time path of capital
%         c ... time path of consumption
%         T ... last period in the plot

subplot(3,1,1);
plot(0:T,k(1:(T+1)),'b-',[0,T],[P.kss,P.kss],'k--');
legend('time path','steady state');
xlim([0,T]);
xlabel('time');
title('capital');

subplot(3,1,2);
plot(0:T,c(1:(T+1)),'r-',[0,T],[P.css,P.css],'k--');
legend('time path','steady state');
xlim([0,T]);
xlabel('time');
title('consumption');

subplot(3,1,3);
plot(0:T,l(1:(T+1)),'r-',[0,T],[P.lss,P.lss],'k--');
legend('time path','steady state');
xlim([0,T]);
xlabel('time');
title('labor');


end