function P = stst(P)

P.iss = 0;
P.lss = 1 - P.a*P.iss;
P.kss = ((1/P.beta - 1 + P.delta)/P.alpha)^(1/(P.alpha - 1));
P.css = P.kss^P.alpha - P.delta*P.kss;
P.wss = (1-P.alpha)*P.kss^P.alpha;
P.rss = P.alpha*P.kss^(P.alpha-1);
P.sss = 1;

end