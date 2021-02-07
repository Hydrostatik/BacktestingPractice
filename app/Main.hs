module Main where

import System.IO
import Data.Csv
import qualified Data.Vector as V
import qualified Data.ByteString.Lazy as BL

import YahooCSVLib
import AlgoLib

main :: IO ()
main = do
    csvData <- BL.readFile "cases/HPQ-Daily.csv"
    case decode HasHeader csvData :: Either String (V.Vector StockSummary) of
        Left err -> putStrLn err
        Right v -> print . movingAverage 5 $ map adjClose (reverse $ V.toList v)