{-  Lösungen zur zweiten Übung in Programmierung im Sommersemester 2019.
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

import Prelude hiding (Tree, words, unwords)

{-  Aufgabe 1 a)    -}
pack :: [Char] -> [[Char]]
pack [] = []
pack (x:xs) = pack' x (x:xs) []
    where
        -- pack' spaltet das Präfix bestehend aus Symbolen
        -- gleich dem erstem Argument von der Liste im zweiten Argument
        -- ab. Der derzeitig abgespaltete Präfix wird im drittem
        -- Argument gespeichert.
        pack' :: Char -> [Char] -> [Char] -> [[Char]]
        pack' _ [] acc = [acc]
        pack' c (x:xs) acc
            | c == x = pack' x xs (x:acc)
            | otherwise = acc : pack' x (x:xs) []

{-  Aufgabe 1 b)    -}
encode :: [Char] -> [(Int, Char)]
encode = encode' . pack
    where
        -- length ist bereits im Modul Prelude vorhanden
        length [] = 0
        length (_:xs) = 1 + length xs
        -- encode' bildet für jede Liste in der übergebenen Liste
        -- ein Tupel aus der Länge und dem erstem Element.
        encode' [] = []
        encode' ((c:cs):css) = (length (c:cs), c) : encode' css
-- encode = map (\ (x:xs) -> (length xs + 1, x)) . pack

{-  Aufgabe 1 c)    -}
decode :: [(Int, Char)] -> [Char]
decode [] = []
decode ((i, c):ics) = replicate i c ++ decode ics
    where
        -- replicate ist bereits im Modul Prelude vorhanden.
        -- replicate n c bildet eine Liste, die genau `n`-mal
        -- das Symbol `c` enthält.
        replicate 0 _ = []
        replicate i c = c : replicate (i-1) c
-- decode = concatMap (uncurry replicate)
-- oder: decode = concat . map (\ (i, c) -> replicate i c)

{-  Aufgabe 1 d)    -}
rotate :: [Int] -> Int -> [Int]
rotate [] _ = []
rotate (x:xs) n
    | n == 0 = (x:xs)
    | n < 0 = rotate (x:xs) (n `mod` length (x:xs))
    | otherwise = rotate (xs ++ [x]) (n-1)

{-  Aufgabe 2 a)    -}
unwords :: [String] -> String
unwords [] = ""
unwords [w] = w
unwords (w:ws) = w ++ (' ' : unwords ws)
-- unwords ist bereits im Modul Prelude vorhanden

{-  Aufgabe 2 b)    -}
words :: String -> [String]
words = words' []
    where
        -- words' speichert den längsten Präfix des zweiten Arguments,
        -- der kein Leerzeichen enthält, im ersten Argument. Wenn
        -- die Funktion auf ein Leerzeichen trifft, wird dieser Präfix
        -- ausgegeben, ansonsten das Zeichen dem Präfix angehangen.
        words' acc [] = [acc]
        words' acc (c:cs)
            | c == ' ' = acc : words' [] cs
            | otherwise = words' (acc ++ [c]) cs
-- words ist bereits im Modul Prelude vorhanden

{-  Aufgabe 3 a)    -}
data Tree = Node String [Tree] deriving (Show)
t = Node "Wurzel" [Node "l" [], Node "m" [Node "lu" [], Node "ru" []], Node "r" []]

{-  Aufgabe 3 b)    -}
level :: Int -> Tree -> [String]
level 0 (Node s _) = [s]
level i (Node _ []) = []
level i (Node s (t:ts)) = level (i-1) t ++ level i (Node s ts)
-- level 0 (Node s _) = [s]
-- level i (Node _ ts) = concatMap (level (i-1)) ts

{-  Zusatzaufgabe 1
  eager evaluation:
    f2 (f1 1) 2
        = f2 ([1] ++ f1 (1 + 1)) 2
        = f2 ([1] ++ f1 2) 2
        = f2 ([1] ++ [2] ++ f1 (2 + 1)) 2
        = f2 ([1] ++ [2] ++ f1 3) 2
        = f2 ([1] ++ [2] ++ [3] ++ f1 4) 2
        = f2 ([1] ++ [2] ++ [3] ++ [4] ++ f1 5) 2
        = …

  lazy evalutaion:
    f2 (f1 1) 2
        = f2 ([1] ++ f1 (1+1)) 2
        = f2 (1 : f1 (1 + 1)) 2
        = f2 (f1 (1 + 1)) 1
        = f2 ([1+1] ++ f1 ((1+1)+1)) 1
        = f2 ((1+1) : f1 ((1+1)+1)) 1
        = (1+1)
        = 2
-}

{-  Zusatzaufgabe 2 a)
  Das Einfügen am Anfang ist unproblematisch mittels dem Listenkonstruktor möglich.
    z.B. insertHead :: Int -> [Int] -> [Int]
         insertHead x xs = (x:xs)
         -- oder insertHead = (:)
  Um am Ende einzufügen muss erst die Liste komplett durchlaufen werden.
    z.B. insertTail :: Int -> [Int] -> [Int]
         insertTail y [] = [y]
         insertTail y (x:xs) = x : insertTail xs y
-}

{-  Zusatzaufgabe 2 b)
  Eine Queue benötigt Zugriff auf das am-frühesten-eingefügte Element.
  D.h. auf Grundlage einer Liste muss entweder hinten eingefügt und Zugriff auf das vorderste
  Element, oder vorne eingefügt und Zugriff auf das hinterste Element gewähleistet werden.
  Um das Problem aus Aufgabenteil (a) zu umgehen, teilen wir die Queue in zwei Listen auf,
  eine nimmt Elemente auf und die andere dient dem Zugriff. Elemente aus der
  ersten Liste werden bei Bedarf in umgekehrter Reihenfolge in die zweite eingefügt.
-}

data Queue = Queue [Int] [Int] deriving (Show)

makeProper :: Queue -> Queue
makeProper (Queue is []) = (Queue [] (reverse is))
makeProper q = q

isEmpty :: Queue -> Bool
isEmpty (Queue _ []) = True
isEmpty _ = False

enqueue :: Int -> Queue -> Queue
enqueue i (Queue is os) = makeProper (Queue (i:is) os)

first :: Queue -> Int
first (Queue _ (i:_)) = i

rest :: Queue -> Queue
rest (Queue is (_:os)) = makeProper (Queue is os)