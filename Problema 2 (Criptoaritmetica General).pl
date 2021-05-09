
:- dynamic(assignation/2).

letter_value(0).
letter_value(1).
letter_value(2).
letter_value(3).
letter_value(4).
letter_value(5).
letter_value(6).
letter_value(7).
letter_value(8).
letter_value(9).

contained(X,L1,L2,L3):- member(X,L1);member(X,L2);member(X,L3).

union(L1,L2,L3,Union):-setof(X,contained(X,L1,L2,L3),Union).

print(L1,L2,L3):- union(L1,L2,L3,Union), print_(Union).

print_([]).
print_([X|R]):- assignation(X,V), write(X), write('=') , write(V), write('\n'), print_(R).


addition([],[],[_],_,_,0):-!,false.
addition(M,N,[Z|K], Value1, Value2, Carry):-
    (
    (assignation(Z,Value3),
     Value3 =:= (Value1 + Value2 + Carry) mod 10)
    ;
    (not(assignation(Z,Value3)),
     Value3 is (Value1 + Value2 + Carry) mod 10),
     assert(assignation(Z,Value3))
     ),
    Carry1 is (Value1 + Value2 + Carry) // 10,
   (upper_addend(M, N, K, Carry1); (retract(assignation(Z,Value3)),false)).

bottom_addend(M,[],K,Value1,Carry):-
    addition(M,[],K,Value1,0,Carry).

bottom_addend(M,[Y|N],K,Value1,Carry):-
    (   assignation(Y,W)
        ;
        letter_value(W),
        assert(assignation(Y,W))  ),
    (addition(M, N, K, Value1, W,Carry); (retract(assignation(Y,W)),false)).

upper_addend([],[],[],_).

upper_addend([],N,K,Carry):-
    bottom_addend([], N, K, 0,Carry).

upper_addend([X|M],N,K,Carry):-
    (   assignation(X,V)
        ;
        letter_value(V),
        assert(assignation(X,V))  ),
   (bottom_addend(M, N, K, V,Carry); (retract(assignation(X,V)),false)).


crypto_arithmetic(X,Y,Z):-
    retractall(assignation(_,_)),
    string_chars(X,S1),
    string_chars(Y,S2),
    string_chars(Z,S3),
    reverse(S1,M),
    reverse(S2,N),
    reverse(S3,K),
    upper_addend(M,N,K,0),
    print(M,N,K).


















