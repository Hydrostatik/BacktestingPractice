module Main where

import qualified Data.ByteString.Lazy as BL
import           Data.Csv
import           Data.List
import qualified Data.Vector          as V
import           System.IO

import           AlgoLib
import           Lib
import           YahooCSVLib

main :: IO ()
main = do
    stockSummary <- convertCSVFile "cases/HPQ-Daily.csv"
    calculateOutput stockSummary

calculateOutput :: V.Vector StockSummary -> IO ()
calculateOutput vec = do
    writeCSVFile "output/HPQ-Daily-Stats.csv" algoFileOutput
    where parsedStocks = vecToListReversed vec
          dates = map date parsedStocks
          stock = map adjClose parsedStocks
          mv7 = movingAverage 7 stock
          mv17 = movingAverage 17 stock
          zipped = zip4 dates stock mv7 mv17
          unzipData ((a,b,c,d):ys) = AlgoOutput {
              aoDate = a
            , backTestInput = b
            , highFreqMA = c
            , lowFreqMA = d
            } : unzipData ys
          unzipData [] = []
          algoFileOutput = unzipData zipped
