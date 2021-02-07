{-# LANGUAGE DeriveGeneric #-}
module YahooCSVLib where

import GHC.Generics
import Data.Csv
import qualified Data.ByteString.Lazy as BL
import qualified Data.Vector as V

data StockSummary = StockSummary {
    date :: !String
,   open :: !Double
,   high :: !Double
,   low :: !Double
,   close :: !Double
,   adjClose :: !Double
,   volume :: !Int
} deriving (Generic, Show)

instance FromRecord StockSummary
instance ToRecord StockSummary

convertCSVFile :: String -> IO (V.Vector StockSummary)
convertCSVFile fileName = do
    csvData <- BL.readFile fileName
    case decode HasHeader csvData :: Either String (V.Vector StockSummary) of 
        Left err -> error err
        Right v -> return v
