function qddot = dinamica_pd(qdot,M,C,G,tau)
    u = M*tau + C*qdot + G;
    qddot = -inv(M)*(C*qdot+G-u);
end
