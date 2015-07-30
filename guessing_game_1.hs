import System.Random  
import Control.Monad(when)  

isValidNumber n = do
    n > 0 && n < 10

testGuessedNumber a b = do
    if a == b
        then putStrLn "You're correct!"
        else putStrLn $ "Sorry, the correct answer was " ++ show a

main = do  
    gen <- getStdGen  
    let (randNumber, _) = randomR (1,10) gen :: (Int, StdGen)     
    putStr "Which number in the range from 1 to 10 am I thinking of? "  
    numberString <- getLine  
    when (not $ null numberString) $ do  
        let number = read numberString  
        if isValidNumber number
            then testGuessedNumber randNumber number
            else putStrLn $ "Please select a number between 1 and 10!"
        newStdGen  
        main
