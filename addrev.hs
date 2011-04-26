module Main where

main :: IO ()
main = do tests <- getLine
          contents <- getContents
          mapM_ (putStrLn . show . addrev . words ) $ take (read tests) (lines contents)

addrev :: [String] -> Int
addrev [a,b] = read $ reverse $ show $ (read $ reverse a) + (read $ reverse b)
