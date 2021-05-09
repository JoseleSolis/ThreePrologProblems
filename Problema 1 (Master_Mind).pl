
bull(H,L,R,N):- bull_(H,[],L,R,N,0).

bull_(H,H,[],[],N,N).
bull_(H,H1,[X|L],[X|R],N,M):- M1 is M + 1, bull_(H,H1,L,R,N,M1).
bull_(H,H1,[X|L],[Y|R],N,M):- not(X==Y),append(H1,[X],H2), bull_(H,H2,L,R,N,M).


cow(H,L,R,N):- cow_(H,L,R,N,0).

cow_(_,[],[],N,N).
cow_(H, [X|L], [X|R], N,M):- cow_(H,L,R,N,M).
cow_(H, [X|L], [Y|R], N, M):- not(X==Y), member(Y,H), M1 is M+1, cow_(H,L,R,N,M1).
cow_(H, [X|L], [Y|R], N, M):- not(X==Y), not(member(Y,H)), cow_(H,L,R,N,M).


random_list(N,List_):- length(List_,N), maplist(random(0,10),List_).


simulation(List,M):- simulation_(List,[],M,0).
simulation_(List,List,_,_):- write('\nYou Win!!\n\n\n\n\n\n').
simulation_(_,_,M,M):- write('\nGame Over :(').
simulation_(List,_,M,K):-

write('\nWrite your next combination:' ),
read(Comb),
bull(H,List,Comb,Bull),
write('\nBulls:\n'),
write(Bull),
cow(H,List,Comb,Cow),
write('\nCows:\n'),
write(Cow),
K1 is K + 1,
simulation_(List,Comb,M,K1).



:-write('Enter value for n: '),
read(N),
write('Enter value for m: '),
read(M),
random_list(N,List),simulation(List,M).








