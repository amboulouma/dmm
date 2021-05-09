function [phi, res] = compute_residuals_phi(P,T,X)
    % computes residuals, H(X) from the slides
    % inputs: P ... parameters and steady state
    %         k0 ... initial capital
    %         I0 ... initial number of infected
    %         T ... time periods
    %         X ... guess for c0, k0, I0, S0, ..., c_T, k_T, I_T, S_T [ 1 x 4 (T+1) ]
    % output: res ... reduals ordered by period

    % unstack variables
    x = reshape(X,5,T+1);       % four variables now
    c = x(1,:);
    k = x(2,:);
    i = x(3,:);
    s = x(4,:);
    l = x(5,:);
    
    phi = 0;
    phi2 = 1;

    % time indices
    now = 1:T;
    next = 2:(T+1);
    
    P.l = 1 - (1 - (1 - P.phi)*P.a)*i(now);

    for t = 1:T+1
        if P.gamma.*P.F(k(t),1-i(t)) - p(t).*(s(t)+P.a.*i(t)).^2 >=0
            phi(t) = 1;
        else
            phi(t) = fzero(@(phi2)  p(t).*(phi2.*(s(t)+P.a.*i(t))).^2 - P.gamma.*P.F(k(t),(1-(1-(1-phi2).*P.a).*i(t))), [0,1]);
        end     
    end
    
    %% residuals of the dynamic equations
    % all Euler equations:
    res_ct = P.du(c(now)) - P.beta*(1+P.FK(k(next),P.l)-P.delta).*P.du(c(next));
    % all capital accumulation equations:
    res_kt = (1-P.delta)*k(now) + P.F(k(now),P.l) - c(now) - k(next);
    % Infection equations
    res_it = (1-P.pi_r)*i(now) + P.pi_s*(P.lambda + (1-P.lambda)*(1-P.phi)*P.a)*i(now).*s(now) - i(next);
    % Susceptible equations
    res_st = s(now).*(1 - P.pi_s*(P.lambda + (1-P.lambda)*(1-P.phi)*P.a)*i(now).*s(now)) - s(next);
    % labor equation
    res_lt = 1 - (1 - (1 - P.phi)*P.a)*i(now) - l(next);
    % stack the conditions
    res = [res_ct; res_kt; res_it; res_st; res_lt];
    % turn into column vector, such that conditions are ordered by periodq
    res = res(:);  
    
    %% residuals of the boundary conditions
    % three initial conditions
    res_k0 = k(1) - P.k0;    
    res_i0 = i(1) - P.i0;
    res_s0 = i(1) - (1-P.i0);                     % because s0 = 1-i0
    res_l0 = l(1) -  (1 - (1 - (1 - P.phi)*P.a)*i(1));
     % one terminal condition
    res_cT = c(end) - P.css;   
    % add initial and terminal conditions (conditions must be ordered by period!)
    res = [ res_k0; res_i0; res_s0; res_l0; res; res_cT ];    
    
end