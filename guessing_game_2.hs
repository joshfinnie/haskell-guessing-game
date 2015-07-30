import System.Random -- LOL

randomNumber = 4 -- chosen by fair dice roll.
                 -- guaranteed to be random.

isValidNumber :: Int -> Bool
isValidNumber n
    | n > 0 && n < 10 = True
    | otherwise       = False

testGuessedNumber :: Int -> Int -> Bool
testGuessedNumber a b
    | a == b    = True
    | otherwise = False

getInt :: IO Int
getInt = do
    num <- getLine
    return $ (read num :: Int)

main :: IO ()
main = do  
    putStr "Which number in the range from 1 to 10 am I thinking of? "
    number <- getInt 
    if isValidNumber number
        then run randomNumber number
        else putStrLn "please select a number between 1 and 10."

run :: Int -> Int -> IO()
run r n
    | outcome == True = do
        putStrLn "You Win!"
    | outcome == False = do
        putStrLn "You guessed incorrectly, please try again."
        number <- getInt
        run r number
    where outcome = testGuessedNumber r n
