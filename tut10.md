## Aufgabe 1
### Aufgabenteil (a)

```
trans(Max)
  = blocktrans({ int a, b, max; ... return 0; })
  = stseqtrans(scanf("%i", &a); ... printf("%d", max);, [a/(var, 1), b/(var, 2), c/(var, 3)], 1)
  = sttrans(scanf("%i", &a);, [a/(var, 1), b/(var, 2), c/(var, 3)], 1.1)
    sttrans(scanf("%i", &b);, [a/(var, 1), b/(var, 2), c/(var, 3)], 1.2)
    sttrans(if (a>b) max = a; else max = b;, [a/(var, 1), b/(var, 2), c/(var, 3)], 1.3)
    sttrans(printf("%i", &a);, [a/(var, 1), b/(var, 2), c/(var, 3)], 1.4)
  = READ 1;
    READ 2;
    boolexptrans(a>b, [a/(var, 1), b/(var, 2), c/(var, 3)])
    JMC 1.3.1;
    sttrans(max=a;, [a/(var, 1), b/(var, 2), c/(var, 3)], 1.3.2)
    JMP 1.3.3;
    1.3.1: sttrans(max=b;, [a/(var, 1), b/(var, 2), c/(var, 3)], 1.3.4)
    1.3.3: WRITE 3;
  = READ 1;
    READ 2;
    LOAD 1; LOAD 2; GT;
    JMC 1.3.1;
    LOAD 1; STORE 3;
    JMP 1.3.3;
    1.3.1: LOAD 2; STORE 3;
    1.3.3: WRITE 3;
```

### Aufgabenteil (b)

```
 1: READ 1;
 2: READ 2;
 3: LOAD 1;
 4: LOAD 2;
 5: GT;
 6: JMC 10;
 7: LOAD 1;
 8: STORE 3;
 9: JMP 12;
10: LOAD 2;
11: STORE 3;
12: WRITE 3;
```

BZ |    DK | HS              | Inp | Out
--:|------:|-----------------|----:|----:
 1 |     ε | []              | 5:7 | ε
 2 |       | [1/5]           | 7   |
 3 |       | [1/5, 2/7]      | ε   |
 4 |     5 |                 |     |
 5 |   7:5 |                 |     |
 6 |     0 |                 |     |
10 |     ε |                 |     |
11 |     7 |                 |     |
12 |     ε | [1/5, 2/7, 3/7] |     |
13 |       |                 |     | 7


## Aufgabe 2
### Aufgabenteil (a)

```
 1: READ 2;
 2: READ 3;
 3: LIT 0;
 4: STORE 1;
 5: LOAD 1;
 6: LOAD 3;
 7: LT;
 8: JMC 18;
 9: LOAD 1;
10: LIT 1;
11: ADD;
12: STORE 1;
13: LOAD 2;
14: LOAD 2;
15: MUL;
16: STORE 2;
17: JMP 5;
18: WRITE 2;
```

### Aufgabenteil (b)

BZ |    DK | HS         | Inp | Out
--:|------:|------------|----:|----:
 1 |     ε | []         | 0:1 | ε
 2 |       | [1/0]      | 1   |
 3 |       | [1/0, 2/1] | ε   |
 4 |     0 | [1/0, 2/1] |     |
 5 |   1:0 | [1/0, 2/1] |     |
 6 | 0:1:0 | [1/0, 2/1] |     |
 7 |   1:0 | [1/0, 2/1] |     |
 8 |     0 | [1/0, 2/1] |     |
 5 |       | [1/0, 2/1] |     |
 6 |   0:0 | [1/0, 2/1] |     |
 7 |     0 | [1/0, 2/1] |     |
 9 |     ε | [1/0, 2/1] |     |
10 |       | [1/0, 2/1] |     | 1

## Zusatzaufgabe 1

siehe [tut10.pl](./tut10.pl)

### Aufgabenteil (c)

```
           ?- t(alice, X).
           ?- s(alice, X).
{X=bob}    ?-.

           ?- t(alice, X).
           ?- s(alice, X).
{X=dory}   ?-.

           ?- t(alice, X).
           ?- s(alice, Y), t(Y, X).
{Y=bob}    ?- t(bob, X).
           ?- s(bob, X).
{X=charly} ?-.
```


## Zusatzaufgabe 2
### Aufgabenteil (a)

```
 1: READ 1;
 2: READ 2;
 3: LOAD 1;
 4: LIT 0;
 5: GT;
 6: JMC 20;
 7: LOAD 2;
 8: LOAD 1;
 9: SUB;
10: STORE 1;
11: LOAD 2;
12: LOAD 1;
13: GT;
14: JMC 19;
15: LOAD 2;
16: LIT 2;
17: DIV;
18: STORE 2;
19: JMP 3;
20: WRITE 1;
```

### Aufgabenteil (b)

BZ |    DK | HS         | Inp | Out
--:|------:|------------|----:|----:
 7 |     ε | [1/3, 2/1] |   ε | ε
 8 |     3 |            |     |
 9 |   1:3 |            |     |
10 | 2:1:3 |            |     |
11 |   2:3 |            |     |
12 |     5 |            |     |
13 |     ε | [1/3, 2/5] |     |
 3 |       |            |     |
 4 |     5 |            |     |
 5 |   5:5 |            |     |
 6 |     0 |            |     |
14 |     ε |            |     |
15 |       |            |     | 3
