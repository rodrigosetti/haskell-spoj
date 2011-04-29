module Main where

main :: IO ()
main = do tests <- getLine
          contents <- getContents
          mapM_ (putStrLn . show . factorialTrailingZeros . read) $ take (read tests) (lines contents)

-- | The 'factorialTrailingZeros' gives the amount of traiing zeros of the n!
--   using Polignac's Formula: the multiplicity of the prime factor 5 in n!
factorialTrailingZeros :: Integral a => a -> a
factorialTrailingZeros n = sum $ takeWhile (>0) $ nestList (`div` 5) (n `div` 5)

-- | The 'nestList' function takes a function and an atom, and returns
--   an infinite list of nested applications of the given function into the atom
nestList :: (a -> a) -> a -> [a]
nestList f x = x:(nestList f (f x) )
