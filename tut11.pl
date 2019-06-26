% Aufgabenteil (a)
% tree(1, tree(2, nil, nil)
%         tree(3, tree(4, nil, nil)
%                 tree(5, nil, nil)))

concat([], YS, YS).
concat([X|XS], YS, [X|ZS]) :- concat(XS, YS, ZS).

notnil(tree(L, T1, T2)).

yield(nil, []).
yield(tree(Y, nil, nil), [Y]).
yield(tree(L, T1, T2), YS) :- notnil(T1), notnil(T2), yield(T1, YS1), yield(T2, YS2), concat(YS1, YS2, YS).