-- arith4.hs
module Arith4 where

roundTrip :: (Show a, Read b) => a -> b
roundTrip = read . show

main :: IO ()
main = do
  print (roundTrip 4 :: Float)
  print (id 4)
