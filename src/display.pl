initial_board([[empty, tile, tile, tile, tile, tile, empty],
              [tile, warrior, tile, king, tile, warrior, tile],
              [tile, tile, tile, tile, tile, tile, tile],
              [tile, tile, tile, tile, tile, tile, tile],
              [tile, tile, tile, tile, tile, tile, tile],
              [tile, warrior, tile, king, tile, warrior, tile],
              [empty, tile, tile, tile, tile, tile, empty]]).


% Display the game board
display_game(Board) :-
    nl,
    write('---|---|---|---|---|---|---|---|\n'),
    write('   | A | B | C | D | E | F | G |\n'),
    write('---|---|---|---|---|---|---|---|\n'),
    display_matrix(Board, 1),
    write('---|---|---|---|---|---|---|---|\n').

% Display each row of the board
display_matrix([], 8).
display_matrix([Head | Rest], N) :-
    write(' ') , write(N), write(' |'),
    display_row(Head),
    N1 is N + 1,
    display_matrix(Rest, N1).

% Display a single row
display_row([]) :- nl.
display_row([Head | Rest]) :-
    write(' '), write_cell(Head), write(' |'),
    display_row(Rest).


% Display a single cell
write_cell(empty) :- write(' ').
write_cell(tile) :- write('T').
write_cell(king) :- write('K').
write_cell(warrior) :- write('W').