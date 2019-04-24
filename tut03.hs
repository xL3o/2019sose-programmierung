{-  Lösungen zur dritten Übung in Programmierung im Sommersemester 2019.
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

import Prelude hiding (even, foldl)
import qualified Data.Tree

{- Typdefinition aus Aufgabe 1. Die Typ- und Wertkonstruktoren wurden umbenannt
   um konflikte mit der Typdefinition aus Aufgabe 2 zu vermeiden.
   `deriving (Show)` am Ende der Typdefinition implementiert eine Ausgabe-
   funktion, die die Datenstruktur in der selben Form wie die der Typdefinition
   ausgibt.                                                                  -}
data BinaryTree = Branch Int BinaryTree BinaryTree | Nil deriving (Show)

-- Beispielbaum
exampleBinaryTree :: BinaryTree
exampleBinaryTree = Branch 4
                        (Branch 2
                            (Branch 1 Nil Nil)
                            (Branch 3 Nil Nil))
                        (Branch 8 Nil Nil)

{-  Aufgabe 1 a)    -}
insert :: BinaryTree -> [Int] -> BinaryTree
insert t [] = t
insert t (x:xs) = insert (insert' t x) xs
    where
        -- insert' implementiert das eigentlich Einfügen in den
        -- Suchbaum für *einen* gegebenen Schlüsselwert.
        insert' :: BinaryTree -> Int -> BinaryTree
        insert' Nil i = Branch i Nil Nil
        insert' (Branch i' t1 t2) i
            | i < i' = Branch i' (insert' t1 i) t2
            | i > i' = Branch i' t1 (insert' t2 i)
            | otherwise = Branch i' t1 t2
-- insert = foldl insert'

{-  Aufgabe 1 b)    -}
eq :: BinaryTree -> BinaryTree -> Bool
eq Nil Nil = True
eq (Branch i1 l1 r1) (Branch i2 l2 r2) = i1 == i2 && l1 `eq` l2 && r1 `eq` r2
-- l1 `eq` l2 == eq l1 l2. Man kann mit den Backticks "`" beliebige Funktionen
-- in Infixschreibweise benutzen. Die Priorität für Infixoperationen ist niedriger
-- als für Funktionen in Präfixschreibweise, aber höher als für Logikoperatoren,
-- deswegen müsssen wir in dieser Zeile keine Klammern setzen.
eq _ _ = False


{- Typdefinition aus Aufgabe 2. Die Typ- und Wertkonstruktoren wurden umbenannt
   um konflikte mit der Typdefinition aus Aufgabe 1 zu vermeiden. -}
data RoseTree = Node Int [RoseTree] deriving (Show)

-- Beispielbaum
exampleRoseTree :: RoseTree
exampleRoseTree = Node 4 [
                    Node 2 [
                        Node 1 [],
                        Node 3 [] ],
                    Node 8 [] ]

{-  Aufgabe 2 a)    -}
noLeaves :: RoseTree -> Int
noLeaves (Node _ []) = 1
noLeaves (Node _ [t]) = noLeaves t
noLeaves (Node i (t:ts)) = noLeaves t + noLeaves (Node i ts)
-- oder: noLeaves (Node _ ts) = sum $ map noLeaves ts

{-  Aufgabe 2 b)    -}
even :: RoseTree -> Bool
even (Node _ ts) = mod (length ts) 2 == 0 && evenRec ts
    where
        evenRec :: [RoseTree] -> Bool
        evenRec [] = True
        evenRec (t:ts) = even t && evenRec ts
        -- evenRec ts = foldr ((&&) . even) True ts
        --            = all even ts
-- even (Node _ ts) = length ts `mod` 2 == 0 && all even ts


{-  Aufgabe 3   -}
f :: [Int] -> Int
f xs = foldr (*) 1 (map (^ 2) (filter (\ i -> mod i 2 == 0) xs))
-- f = foldr (*) 1 . map (^ 2) . filter ((0 ==) . (`mod` 2))
-- Die Funktion `even` aus Prelude ist gleich der Komposition (0 ===) . (`mod` 2),
-- heißt aber leider wie die Funktion aus Aufgabenteil 2 (b).


{-  Zusatzaufgabe 1 a)  -}
l = [[1], [], [1,2,3,4,5,98,-3], [], [], [0,89,2,23,56,54]]
-- maxLength l == 7

{-  Zusatzaufgabe 1 b)  -}
maxLength :: [[Int]] -> Int
maxLength = maximum . map length


{-  Zusatzaufgabe 2 -}
foldl f init [] = init
foldl f init (x:xs) = foldl f (f init x) xs
-- zum Vergleich:
-- foldr f init [] = init
-- foldr f init (x:xs) = f x (foldr f init xs)