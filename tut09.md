## Aufgabe 1

(siehe [tut09.pl](tut09.pl))

### Aufgabenteil (b)

```
          ?-  div(s(s(s(0))), s(s(0)), s(0)).
          ?-  sum(s(s(0)), S0, s(s(s(0)))), div(S0, s(s(0)), 0). % 13
          ?-* sum(0, S0, s(0)), div(S0, s(s(0)), 0).             % 4
{S0=s(0)} ?-  nat(s(0)), div(s(0), s(s(0)), 0).                  % 3
          ?-  nat(s(0)), lt(s(0), s(s(0))).                      % 12
          ?-  nat(s(0)), lt(0, s(0)).                            % 11
          ?-  nat(s(0)), nat(s(0)).                              % 10
          ?-* nat(0), nat(0).                                    % 2
          ?-*.                                                   % 1
```

## Aufgabe 2

(siehe [tut09.pl](tut09.pl))

## Aufgabe 3
### Aufgabenteil (a)

```
                    ?-  subt(s(X, Y), s(s(a, b), s(b, a))).
{X=s(a,b),Y=s(b,a)} ?-. % 1

                    ?- subt(s(X, Y), s(s(a, b), s(b, a))).
                    ?- subt(s(X, Y), s(b, a)).             % 2
{X=b,Y=a}           ?-.                                    % 1

                    ?- subt(s(X, Y), s(s(a, b), s(b, a))).
                    ?- subt(s(X, Y), s(a, b)).             % 3
{X=a,Y=b}           ?-.                                    % 1

% SLD-derivations, aber __keine SLD-refutations__ (führen nicht zum leerem Goal):
?- subt(s(X, Y), s(s(a, b), s(b, a))).
?- subt(s(X, Y), s(b, a)).             % 2
?- subt(s(X, Y), a).                   % 2

?- subt(s(X, Y), s(s(a, b), s(b, a))).
?- subt(s(X, Y), s(b, a)).             % 2
?- subt(s(X, Y), b).                   % 3

?- subt(s(X, Y), s(s(a, b), s(b, a))).
?- subt(s(X, Y), s(a, b)).             % 3
?- subt(s(X, Y), b).                   % 2

?- subt(s(X, Y), s(s(a, b), s(b, a))).
?- subt(s(X, Y), s(a, b)).             % 3
?- subt(s(X, Y), a).                   % 3
```
### Aufgabenteil (b)

```
            ?- subt(s(a, a), X).
{X=s(a, a)} ?-.                   % 1

              ?- subt(s(a, a), X).
{X=s(X1, Y1)} ?- subt(s(a, a), Y1). % 2
{Y1=s(a, a)}  ?-.                   % 1
% X1 ist eine freie Variable, für die alle Belegungen eingesetzt werden können.

              ?- subt(s(a, a), X).
{X=s(X1,Y1)}  ?- subt(s(a, a), Y1). % 2
{Y1=s(X2,Y2)} ?- subt(s(a, a), Y2). % 2
{Y2=s(a, a)}  ?-.                   % 1
% X1 und X2 sind freie Variablen, für die alle Belegungen eingesetzt werden können.

...
```

## Zusatzaufgabe 1

(siehe [tut09.pl](tut09.pl))

### Aufgabenteil (b)

```
        ?-  sublist([<4>, XS], [<5>, <4>, <3>]).
        ?-  sublist([<4>, XS], [<4>, <3>]), nat(<5>).           % 23
        ?-  sublist_prefix(XS, [<3>]), nat(<4>), nat(<5>).      % 22
{XS=[]} ?-  listnat([<3>]), nat(<4>), nat(<5>).                 % 24
        ?-  nat(<3>), listnat([]), nat(<4>), nat(<5>).          % 6
        ?-  nat(<3>), nat(<4>), nat(<5>).                       % 5
        ?-* nat(0), nat(0), nat(0).                             % 2
        ?-*.                                                    % 1

               ?-  sublist([<4>, XS], [<5>, <4>, <3>]).
               ?-  sublist([<4>, XS], [<4>, <3>]), nat(<5>).           % 23
               ?-  sublist_prefix(XS, [<3>]), nat(<4>), nat(<5>).      % 22
{XS=[<3>|XS1]} ?-  sublist_prefix(XS1, []), nat(<4>), nat(<5>).        % 25
{XS1=[]}       ?-  listnat([]), nat(<4>), nat(<5>).                    % 24
               ?-  nat(<4>), nat(<5>).                                 % 5
               ?-* nat(0), nat(0).                                     % 2
               ?-*.                                                    % 1
```