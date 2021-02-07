module Lib where

import qualified Data.Vector as V

vecToListReversed :: V.Vector a -> [a]
vecToListReversed = reverse . V.toList