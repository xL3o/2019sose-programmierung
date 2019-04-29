import Prelude hiding (Tree, unzip)

data Tree a = Branch a (Tree a) (Tree a) | Leaf a deriving (Show)

{-  Aufgabe 1 (a)   -}
exampleTree :: Tree Int
exampleTree = Branch 5
                (Branch 3
                    (Leaf 1)
                    (Leaf 4))
                (Branch 10
                    (Branch 7
                        (Leaf 6)
                        (Leaf 9))
                    (Leaf 15))

{-  Aufgabe 1 (b)   -}
depth :: Tree a -> Int
depth (Leaf _) = 1
depth (Branch _ l r) = min (depth l) (depth r) + 1

{-  Aufgabe 1 (c)   -}
paths :: Tree a -> Tree [a]
paths = paths' []
    where
        -- das erste Argument in paths' „speichert“ den Pfad
        -- von der wurzel bis zum vorherigen Knoten
        paths' :: [a] -> Tree a -> Tree [a]
        paths' xs (Leaf x) = Leaf (xs ++ [x])
        paths' xs (Branch x l r) = let xs' = xs ++ [x]
                                   in (Branch xs' (paths' xs' l) (paths' xs' r))

{-  Aufgabe 1 (d)   -}
tmap :: (a -> b) -> Tree a -> Tree b
tmap f (Leaf a) = Leaf (f a)
tmap f (Branch a l r) = Branch (f a) (tmap f l) (tmap f r)

{-  Aufgabe 2 (a)   -}
unzip :: [(a, b)] -> ([a], [b])
unzip [] = ([], [])
unzip ((a, b):xs) = let (as, bs) = unzip xs in (a:as, b:bs)

{-  Aufgabe 2 (b)
map (uncurry (+)) [(1,2), (3,4)]
    = map (uncurry (+)) ((1,2):[(3,4)])
    = uncurry (+) (1,2) : map (uncurry (+)) [(3,4)]
    = uncurry (+) (1,2) : map (uncurry (+)) ((3,4) : [])
    = uncurry (+) (1,2) : uncurry (+) (3,4) : map (uncurry (+)) []
    = uncurry (+) (1,2) : uncurry (+) (3,4) : []
    = (1 + 2) : (3 + 4) : []
    = 3 : 7 : []
    = [3, 7]
-}

data ZTree a = ZBranch (ZTree a) (ZTree a) | ZLeaf a

{-  Zusatzaufgabe 1 (a)   -}
check :: ZTree Bool -> Bool
check (ZLeaf b) = not b
check (ZBranch l r) = check l || check r

{-  Zusatzaufgabe 1 (b)   -}
toList :: ZTree a -> [a]
toList (ZLeaf a) = [a]
toList (ZBranch l r) = toList r ++ toList l

{-  Zusatzaufgabe 1 (c)   -}
toTree :: [Int] -> ZTree Int
toTree [] = ZLeaf 42
toTree (x:xs) = ZBranch (ZLeaf x) (toTree xs)