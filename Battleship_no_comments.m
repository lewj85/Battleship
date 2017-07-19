clear; clc
newGame = true;
playAgain = 'Y';
while (playAgain == 'Y' | playAgain == 'y')
    pShipRow = -1;
    while ~((pShipRow >=1 & pShipRow <= 3) & (floor(pShipRow)==pShipRow))
        pShipRow = input('Enter the row location of your ship (1-3): ');
    end
    pShipCol = -1;
    while ~((pShipCol >=1 & pShipCol <= 3) & (floor(pShipCol)==pShipCol))
        pShipCol = input('Enter the column location of your ship (1-3): ');
    end
    cShipRow = ceil(3*rand());
    cShipCol = ceil(3*rand());
    disp(['The player''s ship is located at position (' ...
        num2str(pShipRow) ',' num2str(pShipCol) ').']);
    disp(['The computer''s ship is located at position (' ...
        num2str(cShipRow) ',' num2str(cShipCol) ').']);
    turncounter = 1;
    newGame = false;
    while newGame == false
        pRowGuess = -1;
        while ~(pRowGuess >=1 & pRowGuess <= 3)
            pRowGuess = input('Enter a row guess (1-3): ');
        end
        pColGuess = -1;
        while ~(pColGuess >=1 & pColGuess <=3)
            pColGuess = input('Enter a column guess (1-3): ');
        end
        if pRowGuess == cShipRow & pColGuess == cShipCol
            disp(['Hit! The player wins after ' num2str(turncounter) ' turns.']);
            newGame = true;
        else
            disp('Miss!');
            turncounter = turncounter+1;
        end
        if newGame == false  % Because game might end after player's turn
            cRowGuess = ceil(3*rand());
            cColGuess = ceil(3*rand());
            if cRowGuess == pShipRow & cColGuess == pShipCol
                disp(['Hit! The computer wins after ' num2str(turncounter) ' turns.']);
                newGame = true;
            else
                disp(['The computer misses!']);
            end        
        end
    end
    playAgain = 'a';
    while ~(playAgain == 'Y' | playAgain == 'y' | playAgain == 'N' | ...
            playAgain == 'n')
        playAgain = input('Do you wish to play again (''Y'' or ''N'')? ');
    end
end
disp(['Thanks for playing Battleship! gg']);


