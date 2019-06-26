## Aufgabe 1
### Aufgabenteil (a)

```
2.2.1: LOADI (-2); LOAD (lokal, 1); GT; JMC 2.2.2;
LOAD (lokal, -2); PUSH; CALL 1;
LOAD (lokal, 1); LIT 1; ADD; STORE (lokal, 1); JMP 2.2.1;
2.2.2: LOADA (lokal, 1); STORE (lokal, -2);
```

### Aufgabenteil (b)

BZ |    DK | LK              | Ref | Inp | Out
--:|------:|:----------------|:---:|----:|:----
22 |     ε | 1:3:0:1         | 3   | ε   | ε
23 |     1 |                 |     |     |
24 |     ε | 1:3:0:1:1       |     |     |
3  |       | 1:3:0:1:1:25:3  | 7   |     |
4  |       |                 |     |     |
5  |     1 |                 |     |     |
6  |   0:1 |                 |     |     |
7  |     1 |                 |     |     |
8  |     ε |                 |     |     |
9  |     2 |                 |     |     |
10 |   1:2 |                 |     |     |
11 |     2 |                 |     |     |
12 |     ε | 2:3:0:1:1:25:3  |     |     |

## Aufgabe 2

```
 lokal-tab_g = [x/(var, global, 1), y/(var, global, 2),
                f/(proc, 1), g/(proc, 2),
                a/(var, lokal, -3), b/(var-ref, -2), c/(var, lokal, 1)]
```

```
2: INIT 1; LIT 3; STORE (lokal, 1);
LOAD (lokal, 1); LOADI (-2); EQ; JMC 2.2.1;
2.2.2.1: LOAD (lokal, -3); LIT 0; GT; JMC 2.2.2.2;
LOADA (lokal, -3); PUSH; LOAD (lokal, -2); PUSH; CALL 1;
JMP 2.2.2.1;
2.2.2.2: 2.2.1: RET 2;
```

## Aufgabe 3

BZ |    DK | LK              | Ref | Inp | Out
--:|------:|:----------------|:---:|----:|:----
14 |     ε | 0:0:1           | 3   | 4   | ε
15 |       | 4:0:1           |     | ε   |
16 |     1 |                 |     |     |
17 |     ε | 4:0:1:1         |     |     |
3  |       | 4:0:1:1:18:3    | 6   |     |
4  |       |                 |     |     |
5  |     4 |                 |     |     |
6  |   2:4 |                 |     |     |
7  |     1 |                 |     |     |
8  |     ε |                 |     |     |
9  |     4 |                 |     |     |
10 |   2:4 |                 |     |     |
11 |     2 |                 |     |     |
12 |     ε | 2:0:1:1:18:3    |     |     |
18 |       | 2:0:1           | 3   |     |
19 |       |                 |     |     | 2
0  |       |                 |     |     |

## Zusatzaufgabe 1

siehe [tut11.pl](./tut11.pl)