module Main where

main :: IO ()
main = do tests <- getLine
          contents <- getContents
          mapM_ (putStrLn . (playGame "Aayush") . read) $ take (read tests) (lines contents)

playGame :: Integral a => String -> a -> String
playGame p 0 = otherPlayer p
playGame p n
    | even n = playGame (otherPlayer p) $ n `div` 2
    | otherwise = playGame (otherPlayer p) $ n-1

otherPlayer :: String -> String
otherPlayer "Akash" = "Aayush"
otherPlayer "Aayush" = "Akash"
