module LibSpec where

import qualified Data.Vector as V
import Test.Hspec

import Lib

libSpec :: Spec
libSpec = do
    describe "Test Lib" $ do 
        it "Can convert a vector to a reversed list" $ do
            vecToListReversed (V.fromList [1, 2, 3, 4, 5]) `shouldBe` [5, 4, 3, 2, 1]