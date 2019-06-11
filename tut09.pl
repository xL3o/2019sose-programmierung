nat(0).
nat(s(X)) :- nat(X).
sum(0, X, X) :- nat(X).
sum(s(X), Y, s(Z)) :- sum(X, Y, Z).
listnat([]).
listnat([X|XS]) :- nat(X), listnat(XS).

% Aufgabe 1
lt(0, s(Y)) :- nat(Y).
lt(s(X), s(Y)) :- lt(X, Y).
div(0, s(Y), 0) :- nat(Y).
div(s(X), s(Y), 0) :- lt(X, Y).
div(s(X), s(Y), s(Z)) :- sum(s(Y), S, s(X)), div(S, s(Y), Z).

% Aufgabe 2
eval(plus(L, R), E) :- eval(L, LE), eval(R, RE), sum(LE, RE, E).
eval(minus(L, R), E) :- eval(L, LE), eval(R, RE), sum(E, RE, LE).
eval(X, X) :- nat(X).

% Zusatzaufgabe 1
sublist([], YS) :- listnat(YS).
sublist([X|XS], [X|YS]) :- sublist_prefix(XS, YS), nat(X).
sublist([X|XS], [Y|YS]) :- sublist([X|XS], YS), nat(Y).
sublist_prefix([], YS) :- listnat(YS).
sublist_prefix([X|XS], [X|YS]) :- sublist_prefix(XS, YS).