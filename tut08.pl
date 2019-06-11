edge(1, 1).
edge(1, 2).
edge(1, 4).
edge(3, 2).
edge(4, 3).

path(X, X).
path(X, Z) :- edge(X, Y), path(Y, Z).