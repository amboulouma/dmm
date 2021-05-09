function P = SIR(I0, S0, P, tmax, phi) 
S=zeros(1,tmax);
I=zeros(1,tmax);
S(1)=S0;
I(1)=I0;
T(1)=0;

P.max_I = 0;
P.max_I_T = 0;

for t=1:1:tmax
    T(t+1)=t;
    I(t+1) = (1 - P.pi_r)*I(t) + P.pi_s*(P.lambda + (1-P.lambda)*(1-phi)*P.a)*I(t)*S(t); 
    S(t+1) = S(t) - P.pi_s*(P.lambda + (1-P.lambda)*(1-phi)*P.a)*I(t)*S(t);
    
    if I(t+1) > P.max_I
       P.max_I = I(t+1);
       P.max_I_T = T(t+1);
    end
    
end
plot(T,I,T,S);
title("SIR Model");
legend("I(t)","S(t)");
xlabel("time, t");
ylabel("Population");
