module AlgoLib where

movingAverage :: Int -> [Double] -> [Double]
movingAverage 0 _ = error "Cannot Take A Moving Average With Sample Size Zero"
movingAverage _ [] = []
movingAverage x all@(y:ys) = average (take x all) : movingAverage x ys 


average :: [Double] -> Double
average [] = 0
average ys = sum ys / fromIntegral (length ys)