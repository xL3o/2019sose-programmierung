## Aufgabe 1

__Induktionsbasis__:
Sei `x :: a` ein beliebiger Wert des Typs `a` und `t = Leaf x`.
Wir zeigen nun, dass `reverse (yield t) = yield (mirror t)`.

```
reverse (yield t) = reverse (yield (Leaf x))
                  = reverse [x]                 (#9)
                  = [x]                         (E1)
                  = yield (Leaf x)              (#9)
                  = yield (mirror (Leaf x))     (#5)
                  = yield (mirror t)
```

__Induktionsschritt__:
Seien `t₁ :: BinTree a` und `t₂ :: BinTree a`, sodass
`reverse (yield t₁) = yield (mirror t₁)` und `reverse (yield t₂) = yield (mirror t₂)` gelten (`IV`).
Weiterhin, sei `x :: a` ein beliebiger Wert des Typs `a`.
Wir zeigen nun, dass `reverse (yield (Branch x t₁ t₂)) = yield (mirror (Branch x t₁ t₂))`.

```
reverse (yield (Branch x t₁ t₂)) = reverse (yield t₁ ++ yield t₂)            (#8)
                                = reverse (yield t₂) ++ reverse (yield t₁)  (E2)
                                = yield (mirror t₂) ++ yield (mirror t₁)    (IV)
                                = yield (Branch x (mirror t₂) (mirror t₁))  (#8)
                                = yield (mirror (Branch x t₁ t₂))           (#4)
```

## Aufgabe 2

__Induktionsbasis__:
Seien `x :: Int` und `i :: Int` beliebige Ganzzahlen und `t = Leaf x`.
Wir zeigen nun, dass `add (neg i t) = i * sub t`.

```
add (neg i t) = add (neg i (Leaf x))
              = add (Leaf (i * x))      (#12)
              = i * x                   (#4)
              = i * sub (Leaf x)        (#8)
              = i * sub t
```

__Induktionsschritt__:
Seien `t₁ :: IntTree` und `t₂ :: IntTree`, sodass

* für alle `i :: Int`, `add (neg i t₁) = i * sub t₁`, und 
* für alle `j :: Int`, `add (neg j t₂) = j * sub t₂`

gilt (`IV`).

Sei `i :: Int` eine beliebige Ganzzahl.
Wir zeigen nun, dass `add (neg i (Branch t₁ t₂)) = i * sub (Branch t₁ t₂)` gilt.

```
add (neg i (Branch t₁ t₂)) = add (Branch (neg i t₁) (neg (-i) t₂))  (#13)
                          = add (neg i t₁) + add (neg (-i) t₂)     (#5)
                          = i * sub t₁ + (-i) * sub t₂             (IV)
                          = i * sub t₁ - i * sub t₂
                          = i * (sub t₁ - sub t₂)                  (Distr.)
                          = i * sub (Branch t₁ t₂)                 (#9)
```

## Aufgabe 3
### Aufgabenteil (a)
* GV(*t*) = {*x*, *y*}, FV(*t*) = {*y*}
* GV(*t*) = {*x*, *y*, *z*}, FV(*t*) = {*z*}
* GV(*t*) = {*x*, *y*}, FV(*t*) = {*z*, *y*}

### Aufgabenteil (b)
*
  ```
  (λx.(λy.xz(yz)))(λx.y(λy.y))
      `---------´ `----------´
       GV: {y}     FV: {y}
  α
  ⇒ (λx.(λy₁.xz(y₁z)))(λx.y(λy.y))
  β
  ⇒ (λy₁.(λx.y(λy.y))z(y₁z))
             `------´-
               GV: {y} FV: {z}
  β
  ⇒ (λy₁.y(λy.y)(y₁z))
  ```
*
  ```
  (λx.(λy.(λz.z))) x (+ y 1)
      `----------´  -
       GV: {y, z}   FV: {x}
  β
  ⇒ (λy.(λz.z)) (+ y 1)
        `-----´ `------´
         GV: {z}    FV: {y}
  β
  ⇒ (λz.z)
  ```
*
  ```
  (λx.(λy.x (λz.yz))) (((λx.(λy.y)) 8) (λx.(λy.y) x))
      `------------´  `-----------------------------´
       GV: {y, z}      FV: ∅
  β
  ⇒ (λy.(((λx.(λy.y)) 8) (λx.(λy.y) x)) (λz.yz))
              `-----´  -
                 GV: {y} FV: ∅
  β
  ⇒ (λy.((λy.y) (λx.(λy.y) x)) (λz.yz))
                         -  -
                          GV: ∅ FV: ∅
  β
  ⇒ (λy.((λy.y) (λx.x)) (λz.yz))
              - `-----´
               GV: ∅ FV: ∅
  β
  ⇒ (λy.(λx.x) (λz.yz))
             - `------´
              GV: ∅ FV: y
  β
  ⇒ (λy.(λz.yz))
  ```
*
  ```
  (λh.(λx.h(xx))(λx.h(xx))) ((λx.x) (+ 1 5))
                                 -  `-----´
                                 GV: ∅ FV: ∅
  β
  ⇒ (λh.(λx.h(xx))(λx.h(xx))) (+ 1 5)
        `--------.----------´ `------´
         GV: {x}               FV: ∅
  β
  ⇒ (λx.(+ 1 5)(xx))(λx.(+ 1 5)(xx))
        `----------´`---------------´
         GV: ∅       FV: ∅
  β
  ⇒ (+ 1 5)((λx.(+ 1 5)(xx))(λx.(+ 1 5)(xx)))
                `----------´`---------------´
                 GV: ∅       FV: ∅
  β
  ⇒ (+ 1 5)((+ 1 5)((λx.(+ 1 5)(xx))(λx.(+ 1 5)(xx))))
  ⇒ ...
  ```
*
  ```
  (λf.(λa.(λb.fab))) (λx.(λy.x))
      `-----------´  `---------´
       GV: {a, b}     FV: ∅
  β
  ⇒ (λa.(λb.(λx.(λy.x))ab))
                `-----´ -
                 GV: {y} FV: {a}
  β
  ⇒ (λa.(λb.(λy.a)b))
                 - -
                 GV: ∅ FV: {b}
  β
  ⇒ (λa.(λb.a))
  ```

## Zusatzaufgabe 1
__Induktionsanfang__:
Sei `x :: a` ein beliebiger Wert des Typs `a` und `u :: BinTree a`.
Wir zeigen, dass `p (d (Leaf x) u) = p (Leaf x) ++ (p u ++ p u)`.

```
p (d (Leaf x) u) = p (Branch x u u)           (#8)
                 = [x] ++ (p u ++ p u)        (#5)
                 = p (Leaf x) ++ (p u ++ p u) (#4)
```

__Induktionsschritt__:
Seien `t₂, u :: BinTree a` sodass gilt: `p (d t₂ u) = p t₂ ++ (p u ++ p u)` (`IV`).
Weiterhin, sei `x :: a` ein beliebiger Wert des Typs `a` und `t₁ :: BinTree a` ein beliebiger Baum.

Wir zeigen nun, dass `p (d (Branch x t₁ t₂) u) = p (Branch x t₁ t₂) ++ (p u ++ p u)`.

```
p (d (Branch x t₁ t₂) u) = p (Branch x t₁ (d t₂ u))                (#9)
                        = [x] ++ (p t₁ ++ p (d t₂ u))             (#5)
                        = [x] ++ (p t₁ ++ (p t₂ ++ (p u ++ p u))) (IV)
                        = ([x] ++ (p t₁ ++ p t₂)) ++ (p u ++ p u) (B)
                        = p (Branch x t₁ t₂) ++ (p u ++ p u)      (#5)
```