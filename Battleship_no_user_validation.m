clear; clc
newGame = true;
playAgain = 'Y';
while (playAgain == 'Y' | playAgain == 'y')
    pShipRow = input('Enter the row location of your ship (1-3): ');
    pShipCol = input('Enter the column location of your ship (1-3): ');
    cShipRow = ceil(3*rand());
    cShipCol = ceil(3*rand());
    turncounter = 1;
    newGame = false;
    while newGame == false
        pRowGuess = input('Enter a row guess (1-3): ');
        pColGuess = input('Enter a column guess (1-3): ');
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
    playAgain = input('Do you wish to play again (''Y'' or ''N'')? ');
end
disp(['Thanks for playing Battleship! gg']);
