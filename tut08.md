## Aufgabe 1
### Aufgabenteil (a)

```
⟨G⟩ = (λgmn.⟨ite⟩
                (⟨iszero⟩ n)
                m
                (⟨ite⟩
                    (⟨iszero⟩ (⟨pred⟩ n))
                    (⟨succ⟩ m)
                    (⟨add⟩ (g m (⟨sub⟩ n ⟨2⟩)) (g m (⟨pred⟩ n)))))
```

### Aufgabenteil (b)
_Nebenrechnung_:
```
⟨Y⟩⟨F⟩ = (λh.(λy.h(yy))(λy.h(yy))) ⟨F⟩
     ⇒* (λy.⟨F⟩(yy))(λy.⟨F⟩(yy)) = ⟨YF⟩
     ⇒* ⟨F⟩((λy.⟨F⟩(yy))(λy.⟨F⟩(yy))) = ⟨F⟩⟨YF⟩
```

```
⟨Y⟩⟨F⟩⟨2⟩⟨1⟩
⇒* ⟨F⟩⟨YF⟩⟨2⟩⟨1⟩
⇒* ⟨ite⟩ (⟨iszero⟩ ⟨1⟩) ⟨1⟩ (⟨mult⟩ ⟨2⟩ (⟨YF⟩ ⟨2⟩ (⟨pred⟩ ⟨1⟩)))
         `-----------´               `--´    `---------´
          ⇒* ⟨false⟩                 ⇒*⟨F⟩⟨YF⟩    ⇒* ⟨0⟩
⇒* ⟨mult⟩ ⟨2⟩ (⟨F⟩⟨YF⟩⟨2⟩⟨0⟩)
⇒* ⟨mult⟩ ⟨2⟩
        (⟨ite⟩ (⟨iszero⟩ ⟨0⟩) ⟨1⟩ (⟨mult⟩ ⟨2⟩ (⟨YF⟩ ⟨2⟩ (⟨pred⟩ ⟨0⟩))))
              `-----------´
                ⇒* ⟨true⟩
⇒* ⟨mult⟩ ⟨2⟩ ⟨1⟩
⇒* ⟨2⟩
```

## Aufgabe 2
### Aufgabenteil (a)

```
⟨G⟩ = (λgxy.⟨ite⟩ (⟨iszero⟩ y)
                 (⟨mult⟩ x x)
                 (g (⟨mult⟩ ⟨2⟩ x) (⟨pred⟩ y)))
```

### Aufgabenteil (b)
_Nebenrechnung_:
```
⟨Y⟩⟨G⟩ = (λh.(λy.h(yy))(λy.h(yy))) ⟨G⟩
     ⇒* (λy.⟨G⟩(yy))(λy.⟨G⟩(yy)) = ⟨YG⟩
     ⇒* ⟨G⟩((λy.⟨G⟩(yy))(λy.⟨G⟩(yy))) = ⟨F⟩⟨YG⟩
```

```
⟨Y⟩⟨G⟩⟨1⟩⟨3⟩
⇒* ⟨G⟩⟨YG⟩⟨1⟩⟨3⟩
⇒* ⟨ite⟩ (⟨iszero⟩ ⟨3⟩) (⟨mult⟩ ⟨1⟩ ⟨1⟩) (⟨YG⟩ (⟨mult⟩ ⟨2⟩ ⟨1⟩) (⟨pred⟩ ⟨3⟩))
         `-----------´                `--´ `------------´ `---------´
         ⇒* ⟨false⟩                ⇒* ⟨F⟩⟨YG⟩   ⇒* ⟨2⟩      ⇒* ⟨2⟩
⇒* ⟨F⟩⟨YG⟩⟨2⟩⟨2⟩
⇒* ⟨ite⟩ (⟨iszero⟩ ⟨2⟩) (⟨mult⟩ ⟨2⟩ ⟨2⟩) (⟨YG⟩ (⟨mult⟩ ⟨2⟩ ⟨2⟩) (⟨pred⟩ ⟨2⟩))
         `-----------´                `--´ `------------´ `---------´
         ⇒* ⟨false⟩                ⇒* ⟨F⟩⟨YG⟩   ⇒* ⟨4⟩      ⇒* ⟨1⟩
⇒* ⟨F⟩⟨YG⟩⟨4⟩⟨1⟩
⇒* ⟨ite⟩ (⟨iszero⟩ ⟨1⟩) (⟨mult⟩ ⟨4⟩ ⟨4⟩) (⟨YG⟩ (⟨mult⟩ ⟨2⟩ ⟨4⟩) (⟨pred⟩ ⟨1⟩))
         `-----------´                `--´ `------------´ `---------´
         ⇒* ⟨false⟩                ⇒* ⟨F⟩⟨YG⟩   ⇒* ⟨8⟩      ⇒* ⟨0⟩
⇒* ⟨F⟩⟨YG⟩⟨8⟩⟨0⟩
⇒* ⟨ite⟩ (⟨iszero⟩ ⟨0⟩) (⟨mult⟩ ⟨8⟩ ⟨8⟩) (⟨YG⟩ (⟨mult⟩ ⟨2⟩ ⟨8⟩) (⟨pred⟩ ⟨0⟩))
         `-----------´ `-----------´
         ⇒* ⟨true⟩      ⇒* ⟨64⟩
⇒* ⟨64⟩
```

## Aufgabe 3
### Aufgabenteil (a) und (b)

Siehe [tut08.pl](tut08.pl).

### Aufgabenteil (c)

```
      ?- path(4, X).
{X=4} ?-.                        % 7

      ?- path(4, X).
      ?- edge(4, Y), path(Y, X). % 8
{Y=3} ?- path(3, X).             % 5
{X=3} ?-.                        % 7

       ?- path(4, X).
       ?- edge(4, Y1), path(Y1, X). % 8
{Y1=3} ?- path(3, X).               % 5
       ?- edge(3, Y2), path(Y2, X). % 8
{Y2=2} ?- path(2, X).               % 5
{X=2}  ?-.                          % 7
```
mögliche Belegungen für `X`: {`4`, `3`, `2`}


## Zusatzaufgabe 1
### Aufgabenteil (a)

```
(λxyz.yzx) (λx.xy) (λx.x)
   `-----´ `-----´
   GV: {y,z} FV: {y}
α
⇒ (λxy₁z.y₁zx) (λx.xy) (λx.x)
β
⇒ (λy₁z.y₁ z (λx.xy)) (λx.x)
      `------------´  `----´
       GV: {z, x}      FV: ∅
β
⇒ (λz.(λx.x) z (λx.xy))
           -  -
           GV: ∅ FV: {z}
β
⇒ (λz.z (λx.xy))
```

### Aufgabenteil (b)

```
⟨G⟩ = (λgnxy.⟨ite⟩ (⟨iszero⟩ n) ⟨0⟩
                              (⟨sum⟩ (g (⟨pred⟩ n) x y)
                                     (⟨ite⟩ (⟨iszero⟩ (⟨mod⟩ n 2)) x y)))
```

### Aufgabenteil (c)
_Nebenrechnung_:
```
⟨Y⟩⟨F⟩ = (λh.(λy.h(yy))(λy.h(yy))) ⟨F⟩
     ⇒* (λy.⟨F⟩(yy))(λy.⟨F⟩(yy)) = ⟨YF⟩
     ⇒* ⟨F⟩((λy.⟨F⟩(yy))(λy.⟨F⟩(yy))) = ⟨F⟩⟨YF⟩
```

```
⟨Y⟩⟨F⟩⟨2⟩⟨3⟩⟨5⟩
⇒* ⟨F⟩⟨YF⟩⟨2⟩⟨3⟩⟨5⟩
⇒* ⟨ite⟩ (⟨iszero⟩ (⟨pred⟩ ⟨2⟩)) (⟨add⟩ ⟨3⟩ ⟨5⟩) (⟨YF⟩ (⟨pred⟩ ⟨2⟩) (⟨mult⟩ ⟨3⟩ ⟨2⟩) (⟨add⟩ ⟨5⟩ ⟨2⟩))
         `-------------------´              `--´ `---------´ `-----------´  `----------´
           ⇒* ⟨false⟩                 ⇒* ⟨F⟩⟨YF⟩   ⇒* ⟨1⟩      ⇒* ⟨6⟩         ⇒* ⟨7⟩
⇒* ⟨F⟩⟨YF⟩⟨1⟩⟨6⟩⟨7⟩
⇒* ⟨ite⟩ (⟨iszero⟩ (⟨pred⟩ ⟨1⟩)) (⟨add⟩ ⟨6⟩ ⟨7⟩) (⟨YF⟩ (⟨pred⟩ ⟨1⟩) (⟨mult⟩ ⟨6⟩ ⟨1⟩) (⟨add⟩ ⟨7⟩ ⟨1⟩))
         `-------------------´ `-----------´
           ⇒* ⟨true⟩           ⇒* ⟨13⟩
⇒* ⟨13⟩
```

## Zusatzaufgabe 2

```
           ?- prod(<2>, <1>, X).
           ?- prod(<1>, <1>, W1), sum(<1>, W1, X).                   % 8
           ?- prod(0, <1>, W2), sum(<1>, W2, W1), sum(<1>, W1, X).   % 8
{W2=0}     ?- sum(<1>, 0, W1), sum(<1>, W1, X).                      % 7
{W1=s(Z1)} ?- sum(0, 0, Z1), sum(<1>, s(Z1), X).                     % 5
{Z1=0}     ?- nat(0), sum(<1>, <1>, X).                              % 4
           ?- sum(<1>, <1>, X).                                      % 1
{X=s(Z2)}  ?- sum(0, <1>, Z2).                                       % 5
{Z2=<1>}   ?- nat(<1>).                                              % 4
           ?- nat(0).                                                % 2
           ?-.                                                       % 1
```