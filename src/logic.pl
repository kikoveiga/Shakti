
request_move(Row, Column, NewRow, NewColumn) :-
    write('Enter the row and column of the piece you want to move!'), nl,
    write('Enter row:'), nl,
    read(Row),
    write('Enter column:'), nl,
    read(Column),
    write('Enter the row and column of the destination: '), nl,
    write('Enter row:'), nl,
    read(NewRow),
    write('Enter column:'), nl,
    read(NewColumn),
    validate_move_inbounds(Row, Column, NewRow, NewColumn).


player_turn(Board, FinalBoard, 'P', Color) :-
    %write('----------------- ~w PLAYER TURN -----------------', [Color] ), nl,
    repeat,(
        request_move(Row, Column, NewRow, NewColumn)
    ),
    write('test').

    

% Define the game loop
game_loop(Board, P1, P2) :-
    display_game(Board),
    player_turn(Board, NewBoard, P1, 'WHITE'),
    
    game_loop(NewBoard, P1, P2).
    

% Define the start_game predicate
start_game(P1, P2):-
    initial_board(Board), 
    game_loop(Board, P1, P2).