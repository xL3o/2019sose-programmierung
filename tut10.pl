append([], Ys, Ys).
append([X|Xs], Ys, [X|Zs]) :- append(Xs, Ys, Zs).

reverse([], []).
reverse([X|XS], YSX) :- append(YS, [X], YSX), reverse(XS, YS).

palindrom(Xs) :- reverse(Xs, Xs).