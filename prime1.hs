module Main where

main :: IO ()
main = do tests <- getLine
          contents <- getContents
          mapM_ (printPrimesBetween . (map read) . words) $ take (read tests) (lines contents)

printPrimesBetween :: Integral a => [a] -> IO ()
printPrimesBetween [a,b] = do mapM_ (putStrLn . show) $ takeWhile (<=b) $ filter (>=a) primes
                              putChar '\n'

-- | A infinite list of primes
primes :: Integral a => [a]
primes = sieve [2..]

-- | The Sieve of Eratosthenes for prime calculation
sieve :: Integral a => [a] -> [a]
sieve (p:ps) | p > 1 = p:(sieve $ filter ((> 0) . (`mod` p)) ps)
