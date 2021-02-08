{-# LANGUAGE DeriveGeneric #-}
module YahooCSVLib where

import qualified Data.ByteString.Lazy as BL
import           Data.Csv
import qualified Data.Vector          as V
import           GHC.Generics

data StockSummary = StockSummary {
    date     :: !String
,   open     :: !Double
,   high     :: !Double
,   low      :: !Double
,   close    :: !Double
,   adjClose :: !Double
,   volume   :: !Int
} deriving (Generic, Show)

instance FromRecord StockSummary
instance ToRecord StockSummary

convertCSVFile :: String -> IO (V.Vector StockSummary)
convertCSVFile fileName = do
    csvData <- BL.readFile fileName
    case decode HasHeader csvData :: Either String (V.Vector StockSummary) of
        Left err -> error err
        Right v  -> return v


data AlgoOutput = AlgoOutput {
    aoDate        :: !String
,   backTestInput :: !Double
,   highFreqMA    :: !Double
,   lowFreqMA     :: !Double
} deriving (Generic, Show)

instance FromRecord AlgoOutput
instance ToRecord AlgoOutput

writeCSVFile :: String -> [AlgoOutput] -> IO ()
writeCSVFile fileName output = do
    BL.writeFile fileName (encode output)
