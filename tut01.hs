{-  Lösungen zur ersten Übung in Programmierung im Sommersemester 2019.
--  Unter einigen Lösungen sind – auskommentiert – alternative Lösungen
--  gegeben, die entweder – durch Benutzung von Bibliotheksfunktionen –
--  lesbarer sind, oder — im Fall von `fib` – effizienter implementiert sind.
--  Solche Lösungen erfordern natürlich die Kenntnis der Bibliotheksfunktionen
--  in `Prelude` – oder die Suchmaschine https://hoogle.haskell.org.
--
--  Die Funktionen lassen sich mithilfe von GHCi (https://www.haskell.org/ghc/,
--  https://www.haskell.org/downloads/) interaktiv Ausführen. Die Funktionen,
--  die hier definiert werden, können importiert werden, indem entweder
--  * GHCi mit dieser Datei gestartet wird (von der Kommandozeile
--  `ghci <Pfad zu dieser Datei>`), oder
--  * diese Datei in GHCi geladen wird (in GHCi: `:load <Pfad zu dieser Datei>`).
--  Danach kann man z.B. mit `fac 5` das Ergebnis von 5! anzeigen.
-}

{-  Aufgabe 1 a)    -}
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)
-- fac n = product [1..n]

{-  Aufgabe 1 b)    -}
sumfacs :: Int -> Int -> Int
sumfacs n  m
    | n > m = 0
    | otherwise = fac n + sumfacs (n+1) m
-- sumfacs n m = sum (map fac [n..m])


{-  Aufgabe 2
    Achtung: erste Version hat exponentiellen Aufwand, Berechnungen ab `fib 30` dauern lange,
    die zweite Version ist schneller
-}
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib i = fib (i-1) + fib (i-2)
-- fib = fib' 1 1
--     where fib' f0 f1 0 = f0
--           fib' f0 f1 i = fib' f1 (f0 + f1) (i-1)


{-  Aufgabe 3 a)    -}
prod :: [Int] -> Int
prod [] = 1
prod (x:xs) = x * prod xs
-- prod = product :: [Int] -> Int

{-  Aufgabe 3 b)    -}
rev :: [Int] -> [Int]
rev [] = []
rev (x:xs) = rev xs ++ [x]
-- rev = reverse

{-  Aufgabe 3 c)    -}
excl :: Int -> [Int] -> [Int]
excl _ [] = []
excl needle (hay:haystack)
    | needle == hay = excl needle haystack
    | otherwise = hay : excl needle haystack
-- excl = filter . (/=) :: Int -> [Int] -> [Int]

{-  Aufgabe 3 d)    -}
isOrd :: [Int] -> Bool
isOrd [] = True
isOrd [a] = True
isOrd (a:a':as)
    | a <= a' = isOrd (a':as)
    | otherwise = False

{-  Aufgabe 3 e)    -}
merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys


{-  Zusatzaufgabe 1 -}
fibs = fibs' 1
    where fibs' n = fib n : fibs' (n+1)
-- fibs = map fib [1..]


{-  Zusatzaufgabe 2 -}
bintrees 0 = 0
bintrees 1 = 1
bintrees n = bintrees' (n-1)
    where bintrees' 0 = 0
          bintrees' mid = bintrees' (mid-1) + bintrees mid * bintrees (n - mid - 1)
-- bintrees 0 = 0
-- bintrees 1 = 1
-- bintrees n = sum [ bintrees i * bintrees (n-i-1) | i <- [1..n-1] ]