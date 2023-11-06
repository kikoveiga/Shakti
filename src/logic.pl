
% valid_moves(Board, Row, Column, Piece, ListOfMoves){
%     findall(Move, valid_move(Board, Row, Column, Piece), ListOfMoves).

% }

is_destination_tile('tile').

piece_color(white_king, 'WHITE').
piece_color(white_warrior, 'WHITE').
piece_color(black_king, 'BLACK').
piece_color(black_warrior, 'BLACK').

validate_move(Board, [[SR, SC], [DR, DC], Piece], Color) :-
    validate_move_inbounds(SR, SC, DR, DC),
    piece_color(Piece, Color),
    get_value_from_board(Board, SR, SC, CheckTile),
    is_destination_tile(CheckTile).
    
move_piece(Board, Move, Color, FinalBoard) :-
    validate_move(Board, Move, Color).

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
    

player_turn(Board, Move, Color, 'P', FinalBoard) :-
    %write('----------------- ~w PLAYER TURN -----------------', [Color] ), nl,
    move_piece(Board, Move, Color, FinalBoard),
    write('Move successful!'), nl,
    display_game(FinalBoard).

% player_turn(Board, Color, 'P', FinalBoard) :-
%     %write('----------------- ~w PLAYER TURN -----------------', [Color] ), nl,
% 
%     write('Invalid move!'), nl,
%     display_game(FinalBoard).
    
% Define the game loop
game_loop(Board, P1, P2) :-
    request_move(Board, MoveWhite),
    player_turn(Board, MoveWhite, 'WHITE', P1, NewBoard),
    % request_move(NewBoard, MoveBlack),
    % player_turn(NewBoard, MoveBlack, 'BLACK', P2, FinalBoard),
    game_loop(NewBoard, P1, P2).

% Define the start_game predicate
start_game(P1, P2):-
    initial_board(Board), 
    display_game(Board),
    game_loop(Board, P1, P2).