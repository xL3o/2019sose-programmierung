## Aufgabe 1
### Aufgabenteil (a)

Wir bestimmen die Schleifeninvariante in zwei Teilen, A und B.

Für den ersten Teil protokollieren wir die Variablenbelegungen nach jedem Schleifendurchlauf:

Iteration   | `x1`                  | `z`
------------|-----------------------|-------------------
0           | `x`                   | 0
1           | `x`-1                 | 0+`y`     (=`y`)
2           | (`x`-1)-1 (=`x`-2)    | `y`+`y`   (=2⋅`y`)
…           | …                     | …
i           | `x`-i                 | i⋅`y`

Im i-ten Schleifendurchlauf ist `x1` also mit `x`-i und `z` mit i⋅`y` belegt.
Mit den folgenden Umformungen können wir die Beziehung zwischen den vier Variablen in einer Gleichung darstellen:

* `x1` = `x` - i ⟺ `x1` + i = `x` ⟺ i = `x` - `x1`
* `z` = i ⋅ `y` ⟺ `z` = (`x` - `x1`) ⋅ `y`

Die Gleichung A = (`z` = (`x` - `x1`) ⋅ `y`) gilt also in *jedem* Schleifendurchlauf.

Für den zweiten Teil modifizieren wir die Schleifenbedingung (und die Belegung aller Variablen in der Schleifenbedingung durch die Vorbedingung) so, dass sie auch nach dem letzten Schleifendurchlauf noch gilt.
Vor der Schleife gilt `x1` = `x` und `x` ≥ 0, also `x1` ≥ 0.
Die Schleifenbedingung ist (`x1` > 0), im letzten Durchlauf wird die Variable `x1` noch um 1 dekrementiert (sie ist dann gleich 0).
Also muss vor, während und nach der Schleife gelten, dass (`x1` ≥ 0).

Die Schleifeninvariante setzt sich nun aus der Konjunktion beider Teile zusammen:
SI = (`z` = (`x` - `x1`) ⋅ `y`) ∧ (`x1` ≥ 0).

### Aufgabenteil (b)

* A = SI
* B = SI ∧ ¬(`x1` > 0)
* C = SI
* D = SI
* E = SI ∧ (`x1` > 0)
* G = SI

### Aufgabenteil (c)

Die Gütigkeit lässt sich nicht durch das Zuweisungsaxiom zeigen, also muss entweder mit einer stärkeren Vor- oder schwächeren Nachbedinung nachgeholfen werden.
Wir verwenden hier die stärkere Vorbedingung, indem wir zeigen, dass es eine Vorbedingung H gibt, sodass E ⇒ H (also E eine stärkere Vorbedingung als H ist) und das Zuweisungsaxiom {H} `x1 = x1-1;` {F} gilt.
Da das Zuweisungsaxiom rein syntaktisch definiert ist, ergibt sich H indem wir in F jedes Vorkommen von `x1` durch (`x1` - 1) ersetzen.
Also ist H = (`z` + `y` = (`x` - (`x1` - 1)) ⋅ `y`) ∧ ((`x1` - 1) ≥ 0).
wir müssen also nur noch zeigen, dass E ⇒ H gilt.

Wir formen schrittweise um:<br>
(`z` = (`x` - `x1`) ⋅ `y`)<br>
    ⟺ (`z` + `y` = (`x` - `x1`) ⋅ `y` + `y`)<br>
    ⟺ (`z` + `y` = (`x` - `x1` + 1) ⋅ `y`)<br>
    ⟺ (`z` + `y` = (`x` - (`x1` - 1)) ⋅ `y`)<br>

(`x1` ≥ 0) ∧ (`x1` > 0)<br>
    ⟺ (`x1` > 0) ((`x1` > 0) impliziert (`x1` ≥ 0))<br>
    ⟺ ((`x1` - 1) > -1)<br>
    ⟺ ((`x1` - 1) ≥ 0) (`x1` ist eine Ganzzahl)

Also gilt (`z` = (`x` - `x1`) ⋅ `y`) ∧ (`x1` ≥ 0) ∧ (`x1` > 0) ⟹ (`z` + `y` = (`x` - (`x1` - 1)) ⋅ `y`) ∧ ((`x1` - 1) ≥ 0).

## Aufgabe 2
### Aufgabenteil (a)

* A = true ∧ (`y` < 0)
* B = true ∧ ¬(`y` < 0)
* C = true ∧ (`y`< 0)
* D = true ∧ (`y`< 0)
* E = (-(3⋅`y`) + 1 ≥ 0)
* F = (-(3⋅`y`) + 1 ≥ 0)
* G = (-(3⋅`y`) + 1 ≥ 0)
* H = (-`x` + 1 ≥ 0)
* J = (-`x` + 1 ≥ 0)
* K = (`y` ≥ 0)
* L = stärkere Vorbedingung
* M = Sequenzregel

### Aufgabenteil (b)

Wir formen schrittweise um: <br>
true ∧ (`y` < 0) <br>
⟺ (`y` < 0) <br>
⟺ (`y` ≤ -1) (`y` ist eine Ganzzahl) <br>
⟺ (-3 ⋅`y` ≥ 3) (Richtung des Vergleichsoperators ändert sich durch Multiplikation mit -3) <br>
⟺ (-3 ⋅`y` + 1 ≥ 4) <br>
⟹ (-3 ⋅`y` + 1 ≥ 0) (schwächere Bedingung, da 4 ≥ 0)

## Zusatzaufgabe 1
### Aufgabenteil (a)

Iteration   | `i`       | `b`
------------|-----------|----------
0           | `n`       | 1
1           | `n`-1     | `a`
2           | `n`-2     | `a`⋅`a`
…           | …         | …
j           | `n`-j     | `a`^j

* `i` = `n` - j ⟺ j = `n` - `i`
* `b` = `a`^j ⟺ `b` = `a`^(`n` - `i`)

SI = (`b` = `a`^(`n` - `i`)) ∧ (`i` ≥ 0)

### Aufgabenteil (b)

* A = SI
* B = SI ∧ ¬(i>0)
* C = SI
* D = SI ∧ (i>0)
* E = `{ b=b*a; i=i-1; }`