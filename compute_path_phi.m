function [c,k,i,s,l,phi,p] = compute_path_phi(P,T)
    % computes equilibrium path starting from (k0,I0)
    % inputs: P ... parameters and steady state
    %         T ... time periods for simulation
    % output: c ... time path of consumption:  c0,...,c_T      [ 1 x T+1 ]
    %         k ... time path of capital:      k0,...,k_T      [ 1 x T+1 ]
    %         i ... time path of infected:     I0,...,I_T      [ 1 x T+1 ]
    %         s ... time path of susceptibles: S0,...,S_T      [ 1 x T+1 ]

    % guess for c0,...,c_T
    cguess = P.css*ones(1,T+1);
    % guess for k0,...,k_T
    kguess = P.k0*ones(1,T+1);
    % guess for I0,...,I_T
    iguess = .5*ones(1,T+1);
    % guess for S0,...,S_T
    sguess = .5*ones(1,T+1); 
    % guess for S0,...,S_T
    lguess = P.lss*ones(1,T+1); 

    % combine
    xguess = [cguess; kguess; iguess; sguess; lguess];    
    % stack columns
    Xguess = xguess(:);
    
    % Jacobian pattern
    J = spdiags(ones(T+1,2),[-1,0],T+2,T+1); 
    J = kron(J,ones(5));       % five variables now
    % adjust boundaries
    J = J(2:(end-3),:);        % 3 initial conditions, 2 terminal condition
                               % => must delete first row and last 3 rows
    
    opts = optimoptions('fsolve','Algorithm','trust-region','JacobPattern',J,'display','none');
    X = fsolve(@(X) compute_residuals_phi_p(P,T,X), Xguess, opts);
    [res, phi, p] = compute_residuals_phi_p(P,T,X)
    x = reshape(X,5,T+1);      % 5 variables 
    c = x(1,:);
    k = x(2,:); 
    i = x(3,:);
    s = x(4,:);
    l = x(5,:);
    
    if abs(k(end)-P.kss)>1e-3
       warning('Terminal point is not close to the steady state. Consider increasing T.');
    end
    
end