function plot_traj(P,k,c)
    % plot steady state and trajectory in the (k,c) plane
    % inputs: P ... parameters and steady state
    %         k ... time path of capital
    %         c ... time path of consumption

    plot(k(1),c(1),'b.','MarkerSize',20);
    hold on
    plot(P.kss,P.css,'r.','MarkerSize',20);
    plot(k,c,'b-');
    hold off
    xlabel('k');
    ylabel('c');
    legend('initial point','steady state','time path','Location','SouthEast');
    
    %xlim([0,4]);
    %ylim([0,2]);

end