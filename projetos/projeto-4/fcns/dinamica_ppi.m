function qddot = dinamica_ppi(qdot,M,C,G,tau)
    qddot = -inv(M)*(C*qdot+G-tau);
end
