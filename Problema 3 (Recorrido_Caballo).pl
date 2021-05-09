posxy(2,1).
posxy(2,-1).
posxy(-2,1).
posxy(-2,-1).
posxy(1,2).
posxy(1,-2).
posxy(-1,2).
posxy(-1,-2).

jump(X1/Y1, X2/Y2, N):- posxy(Px,Py),X2 is X1+Px,1 =< X2,X2=<N,Y2 is Y1+Py,1=<Y2,Y2=<N.

visit(R,R,_).
visit([P1|R1],R,N):- jump(P1,P2,N), not(member(P2,[P1|R1])), visit([P2,P1|R1],R,N).

knight(X/Y, N, R):- M is N*N, length(R1,M), visit([X/Y],R1,N), reverse(R1,R).










