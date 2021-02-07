import Test.Hspec

import AlgoSpec
import LibSpec
import YahooCSVSpec

main :: IO ()
main = hspec spec

spec :: Spec 
spec = do
    describe "Algorhitm Tests"      algoSpec
    describe "Business Logic Tests" libSpec