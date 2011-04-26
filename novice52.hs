module Main where

main :: IO ()
main = do tests <- getLine
          contents <- getContents
          mapM_ (putStrLn . (playGame "Aayush")) $ take (read tests) (lines contents)

type PlayerName = String
type GameInput = String

playGame :: PlayerName -> GameInput -> PlayerName
playGame p i
    | hasEqualsNeighbours i = playGame (otherPlayer p) (takeOneEqualNeighbour i)
    | otherwise = otherPlayer p

hasEqualsNeighbours :: Eq a => [a] -> Bool
hasEqualsNeighbours (x:y:xs) = x == y || hasEqualsNeighbours (y:xs)
hasEqualsNeighbours _ = False

takeOneEqualNeighbour :: Eq a => [a] -> [a]
takeOneEqualNeighbour (x:y:xs) = if x == y then (x:xs) else (x: takeOneEqualNeighbour (y:xs))
takeOneEqualNeighbour x = x

otherPlayer :: PlayerName -> PlayerName
otherPlayer "Akash" = "Aayush"
otherPlayer "Aayush" = "Akash"
