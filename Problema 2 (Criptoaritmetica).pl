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


crypto_arithmetic(S,E,N,D,M,O,R,Y) :-

    letter_value(S), not(S == 0),
    letter_value(E), not(S == E),
    letter_value(N), not(N == S), not(N == E),
    letter_value(D), not(D == N), not(D == S), not(D == E),

    word_value([S,E,N,D], SendValue),

    letter_value(M), not(M == 0), not(M == D), not(M == N), not(M == E), not(M == S),
    letter_value(O), not(O == M), not(O == D), not(O == N), not(O == E), not(O == S),
    letter_value(R), not(R == O), not(R == M), not(R == D), not(M == N), not(M == E), not(M == S),

    word_value([M,O,R,E], MoreValue),

    letter_value(Y), not(Y == R), not(Y == O), not(Y == M), not(Y == D), not(Y == N), not(Y == E), not(Y == S),

    word_value([M,O,N,E,Y], MoneyValue),

    MoneyValue is SendValue + MoreValue.

word_value([A,B,C,D], Value)   :- Value is 1000*A+100*B+10*C+D.
word_value([A,B,C,D,E], Value) :- Value is 10000*A+1000*B+100*C+D*10+E.
















