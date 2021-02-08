module Lib where

import qualified Data.Vector as V

import           AlgoLib
import           YahooCSVLib

vecToListReversed :: V.Vector a -> [a]
vecToListReversed = reverse . V.toList

