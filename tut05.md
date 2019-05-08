## Aufgabe 1
### Aufgabenteil (a)

{ ( δ(α, σ(x₁, α), σ(x₂, x₃)), δ(α, σ(x₁, x₂), σ(x₂, γ(x₂))) ) }

(Dek.) ⇒ { (α, α), (σ(x₁, α), σ(x₁, x₂)), (σ(x₂, x₃), σ(x₂, γ(x₂))) }

(3×Dek.) ⇒ { (x₁, x₁), (α, x₂), (x₂, x₂), (x₃, γ(x₂)) }

(2×Ele.) ⇒ { (α, x₂), (x₃, γ(x₂)) }

(Vert.) ⇒ { (x₂, α), (x₃, γ(x₂)) }

(Subst.) ⇒ { (x₂, α), (x₃, γ(α)) }

allg. Unifikator: x₁ ↦ x₁, x₂ ↦ α, x₃ ↦ γ(α)

### Aufgabenteil (b)

* t₁ und t₂ sind nicht unifizierbar
* t₁ und t₃ sind unifizierbar mit: a ↦ b, b ↦ b, c ↦ \[b\]
* t₂ und t₃ sind unifizierbar mit: b ↦ Int, c ↦ \[Double\]

## Aufgabe 2
### Aufgabenteil (a)

{ (σ(γ(x₂), σ(γ(α)), x₃), σ(x₁, σ(γ(α), σ(α, x₁)))) }

(Dek.) ⇒ { (γ(x₂), x₁), (σ(γ(α), x₃), σ(γ(α), σ(α, x₁))) }

(Dek.) ⇒ { (γ(x₂), x₁), (γ(α), γ(α)), (x₃, σ(α, x₁)) }

(Dek.) ⇒ { (γ(x₂), x₁), (α, α), (x₃, σ(α, x₁)) }

(Dek.) ⇒ { (γ(x₂), x₁), (x₃, σ(α, x₁)) }

(Vert.) ⇒ { (x₁, γ(x₂)), (x₃, σ(α, x₁)) }

(Subst.) ⇒ { (x₁, γ(x₂)), (x₃, σ(α, γ(x₂))) }

allg. Unifikator: x₁ ↦ γ(x₂), x₂ ↦ x₂, x₃ ↦ σ(α, γ(x₂))

### Aufgabenteil (b)

* x₁ ↦ γ(α), x₂ ↦ α, x₃ ↦ σ(α, γ(α))
* x₁ ↦ γ(γ(α)), x₂ ↦ γ(α), x₃ ↦ σ(α, γ(γ(α)))

## Aufgabe 3

Induktionsbasis:

Sei `xs` = `[]`.
```
sum (foo xs) = sum (foo [])
             = sum ([])                 (#2)
             = 0                        (#6)
             = 0 - 0
             = 2 * 0 - 0
             = 2 * sum [] - 0           (#6)
             = 2 * sum [] - length []   (#10)
             = 2 * sum xs - length xs
```

Induktionsschritt:

Sei `xs :: [Int]`, sodass `sum (foo xs) = 2 * sum xs - length xs` (IV).
Weiterhin, sei `x :: Int` eine beliebige Zahl.

Wir zeigen nun, dass `sum (foo (x:xs)) = 2 * sum (x:xs) - length (x:xs)`.
```
sum (foo (x:xs)) = sum (x : x : (-1) : foo xs)          (#3)
                 = x + sum (x : (-1) : foo xs)          (#7)
                 = x + (x + sum ((-1) : foo xs))        (#7)
                 = x + (x + (-1 + sum (foo xs)))        (#7)
                 = x + x - 1 + sum (foo xs)             (Assoz.)
                 = x + x - 1 + 2 * sum xs - length xs   (IV)
                 = x + x + 2 * sum xs - 1 - length xs   (Komm.)
                 = 2 * x + 2 * sum xs - 1 - length xs   (Def. Multipl.)
                 = 2 * (x + sum xs) - (1 + length xs)   (Distr.)
                 = 2 * sum (x:xs) - (1 + length xs)     (#7)
                 = 2 * sum (x:xs) - length (x:xs)       (#11)
```

## Zusatzaufgabe 1

{ (δ(σ(γ(x₃), x₂), γ(γ(α)), γ(x₁)), δ(σ(γ(α), γ(γ(x₃))), γ(x₁), γ(x₁))) }

(Dek.) ⇒ { (σ(γ(x₃), x₂), σ(γ(α), γ(γ(x₃)))), (γ(γ(α)), γ(x₁)), (γ(x₁), γ(x₁)) }

(3×Dek.) ⇒ { (γ(x₃), γ(α)), (x₂, γ(γ(x₃))), (γ(α), x₁), (x₁, x₁) }

(Dek.) ⇒ { (x₃, α), (x₂, γ(γ(x₃))), (γ(α), x₁), (x₁, x₁) }

(Elem.) ⇒ { (x₃, α), (x₂, γ(γ(x₃))), (γ(α), x₁) }

(Vert.) ⇒ { (x₃, α), (x₂, γ(γ(x₃))), (x₁, γ(α)) }

(Subst.) ⇒ { (x₃, α), (x₂, γ(γ(α))), (x₁, γ(α)) }

allg. Unifikator: x₁ ↦ γ(α), x₂ ↦ γ(γ(α)), x₃ ↦ α

## Zusatzaufgabe 2

Induktionsbasis:

Sei `xs` = `[]`.
```
length (dup xs) = length (dup [])
                = length []         (#2)
                = 0                 (#10)
                = 1 - 1
                = pow [] - 1        (#6)
                = pow xs - 1
```

Induktionsschritt:

Sei `xs :: [Int]`, sodass `length (dup xs) = pow xs - 1` (IV).
Weiterhin, sei `x :: Int` eine beliebige Zahl.

Wir zeigen nun, dass `length (dup (x:xs)) = pow (x:xs) - 1`.
```
length (dup (x:xs)) = length (x : (dup xs ++ dup xs))       (#3)
                    = 1 + length (dup xs ++ dup xs)         (#11)
                    = 1 + length (dup xs) + length (dup xs) (B)
                    = 1 + (pow xs - 1) + (pow xs - 1)       (IV)
                    = 1 + pow xs - 1 + pow xs - 1           (Assoz.)
                    = pow xs + pow xs - 1                   (Komm.)
                    = 2 * (pow xs) - 1                      (Def. Multipl.)
                    = pow (x:xs) - 1                        (#7)

```