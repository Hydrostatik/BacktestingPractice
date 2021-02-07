module AlgoSpec where

import Test.Hspec
import Control.Exception (evaluate)

import AlgoLib

algoSpec :: Spec
algoSpec = do 
    describe "Test AlgoLib" $ do 
        it "Can calculate the average on a list of Doubles" $ do 
            average [1.5,2.3,3.4,4.9,5.1] `shouldBe` 3.44
        it "Returns 0 if average gets empty list" $ do 
            average [] `shouldBe` 0.0
        it "Can calculate moving average over a list of Doubles" $ do 
            movingAverage 3 [1.0,2.0,3.0,4.0,5.0] `shouldBe` [2.0,3.0,4.0,4.5,5.0]
        it "Throws an exception when sample size is set to 0 for the moving average" $ do 
            evaluate (movingAverage 0 [1.0,2.0,3.0,4.0,5.0]) `shouldThrow` anyErrorCall