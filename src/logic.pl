
% valid_piece_move/6 predicate checks if the move for a specific piece is valid according to the game rules.
valid_piece_move(Board, SR, SC, DR, DC, white_king) :-

% piece_color/2 predicate associates a piece with its color.  
piece_color(white_king, 'WHITE').
piece_color(white_warrior, 'WHITE').
piece_color(black_king, 'BLACK').
piece_color(black_warrior, 'BLACK').

% validate_move/3 predicate validates a move by checking the piece color, the destination tile, and if the move is valid for the piece.
validate_move(Board, [[SR, SC], [DR, DC], Piece], Color) :-
    get_value_from_board(Board, SR, SC, Piece),
    piece_color(Piece, Color),
    get_value_from_board(Board, DR, DC, tile),
    valid_piece_move(Board, SR, SC, DR, DC, Piece).

% move_piece/4 predicate moves a piece on the board if the move is valid and prints a success message.
move_piece(Board, Move, Color, FinalBoard) :-

    validate_move(Board, Move, Color),
    write('This move is legal! Well done :)'), nl.

% request_move/3 predicate asks the user to enter the row and column of the piece they want to move and the destination.
% It then gets the value of the piece at the source location from the board.
request_move(Board, [[SR, SC], [DR, DC], Piece]) :-

    write('Enter the row and column of the piece you want to move!'), nl,
    write('Enter row (1 to 7):'), nl,
    read_until_between(1, 7, SR),
    write('Enter column (1 to 7):'), nl,
    read_until_between(1, 7, SC),


    write('Enter the row and column of the destination: '), nl,
    write('Enter row (1 to 7):'), nl,
    read_until_between(1, 7, DR),
    write('Enter column (1 to 7):'), nl,
    read_until_between(1, 7, DC),

    get_value_from_board(Board, SR, SC, Piece).
    
% player_turn/4 predicate represents a player's turn. It repeatedly requests a move from the player until a valid move is made.
% After the move, it displays the updated game board.

player_turn(Board, Color, 'P', FinalBoard) :-
    write('----------------- ~w PLAYER TURN -----------------', [Color] ), nl,
    repeat,
    request_move(Board, Move),
    move_piece(Board, Move, Color, FinalBoard),
    !,
    write('Move successful!'), nl,
    display_game(FinalBoard).


    
% game_loop/3 predicate defines the game loop, where each player takes turns until the game ends.
game_loop(Board, P1, P2) :-
    player_turn(Board,'WHITE', P1, NewBoard),
    %player_turn(NewBoard, 'BLACK', P2, FinalBoard),
    % player_turn(NewBoard, MoveBlack, 'BLACK', P2, FinalBoard),
    game_loop(NewBoard, P1, P2).

% start_game/2 predicate starts the game. It initializes the game board, displays it, and starts the game loop.
start_game(P1, P2):-
    initial_board(Board), 
    display_game(Board),
    game_loop(Board, P1, P2).