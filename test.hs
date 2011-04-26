module Main where

main :: IO ()
main = do contents <- getContents
          mapM_ putStrLn $ takeWhile (/="42") $ lines contents
