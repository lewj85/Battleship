% Simple MATLAB Battleship Game
% Jesse Lew
clear; clc

% The game is played on a 3x3 grid, but a matrix is not needed unless
% visualization is required.

newGame = true;  % Flag initialized to true to force setup for first game 

%***********************************************************
% Outermost loop only runs while player wants to keep playing
% Note: Guaranteed to run once no matter what
%***********************************************************
playAgain = 'Y';  % Initialized to enter loop below the first time
while (playAgain == 'Y' | playAgain == 'y')

    %***********************************************************
    % GAME SETUP
    %***********************************************************
    
    %***********************************************************
    % First two inner loops let player choose the location for their ship
    % Note: The only reason these are loops is because we want User Validation
    %***********************************************************
    pShipRow = -1;  % Initialized to a 'bad' value to enter loop below
    % While the row value is NOT (between 1 and 3 AND also an integer)
    while ~((pShipRow >=1 & pShipRow <= 3) & (floor(pShipRow)==pShipRow))
        % Get a row value
        pShipRow = input('Enter the row location of your ship (1-3): ');
    end
    pShipCol = -1;  % Initialized to a 'bad' value to enter loop below
    % While the column value is NOT (between 1 and 3 AND also an integer)
    while ~((pShipCol >=1 & pShipCol <= 3) & (floor(pShipCol)==pShipCol))
        % Get a column value
        pShipCol = input('Enter the column location of your ship (1-3): ');
    end


    %***********************************************************
    % Randomize the enemy ship's location
    %***********************************************************
    cShipRow = ceil(3*rand());  % Generate a random integer from 1-3
    cShipCol = ceil(3*rand());  % Generate a random integer from 1-3

    
    %***********************************************************
    % Print the ship locations for testing purposes
    % Note: Comment these out
    %***********************************************************
    disp(['The player''s ship is located at position (' ...
        num2str(pShipRow) ',' num2str(pShipCol) ').']);
    disp(['The computer''s ship is located at position (' ...
        num2str(cShipRow) ',' num2str(cShipCol) ').']);
    
    
    %***********************************************************
    % Reset values
    %***********************************************************
    turncounter = 1;  % Reset the turn counter each game
    newGame = false;  % Reset the new game flag after setup is finished
    
    
    %***********************************************************
    % MAIN GAME LOOP
    %***********************************************************
    while newGame == false  % Loop through MAIN GAME until game is over

        %***********************************************************
        % Player's turn
        %***********************************************************

        %***********************************************************
        % Use two loops get the player's row and column guesses
        % Note: The only reason these are loops is because we want User Validation
        %***********************************************************
        pRowGuess = -1;  % Initialized to a 'bad' value to enter loop below
        % While the player's row guess is NOT in range
        while ~(pRowGuess >=1 & pRowGuess <= 3)
            % Guess a row
            pRowGuess = input('Enter a row guess (1-3): ');
        end
        pColGuess = -1;  % Initialized to a 'bad' value to enter loop below
        % While the player's column guess is NOT in range
        while ~(pColGuess >=1 & pColGuess <=3)
            % Guess a column
            pColGuess = input('Enter a column guess (1-3): ');
        end


        %***********************************************************
        % Compare the player's guess to the computer's ship location
        %***********************************************************
        % If both the row and column guesses are correct
        if pRowGuess == cShipRow & pColGuess == cShipCol
            % The player hits and wins
            disp(['Hit! The player wins after ' num2str(turncounter) ' turns.']);
            newGame = true;  % Put up game end flag
        else
            % The player misses
            disp('Miss!');
            turncounter = turncounter+1;  % Update the turn counter
        end


        %***********************************************************
        % Computer's turn
        %***********************************************************

        if newGame == false  % Because game might end after player's turn
            %***********************************************************
            % Make the computer guess
            %***********************************************************
            cRowGuess = ceil(3*rand());  % Generate a random integer from 1-3
            cColGuess = ceil(3*rand());  % Generate a random integer from 1-3


            %***********************************************************
            % Compare computer's guess to the player's ship location
            %***********************************************************
            % If both the row and column guesses are correct
            if cRowGuess == pShipRow & cColGuess == pShipCol
                % The computer hits and wins
                disp(['Hit! The computer wins after ' num2str(turncounter) ' turns.']);
                newGame = true;  % Put up game end flag
            else
                % The computer misses
                disp(['The computer misses!']);
            end
            
        end  % End computer turn loop
    
    end  % End MAIN GAME LOOP    
    
    
    %***********************************************************
    % PLAY AGAIN?
    %***********************************************************
    
    %***********************************************************
    % Final loop asks the player if they want to play again
    % Note: The only reason this is a loop is because we want User Validation
    %***********************************************************
    playAgain = 'a';  % Set to 'bad' value to enter loop below
    % While playAgain isn't set to a 'good' value
    while ~(playAgain == 'Y' | playAgain == 'y' | playAgain == 'N' | ...
            playAgain == 'n')
        % Ask the player if they want to play again
        playAgain = input('Do you wish to play again (''Y'' or ''N'')? ');
    end
end

disp(['Thanks for playing Battleship! gg']);


