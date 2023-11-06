% verify if the move is within bounds
validate_move_inbounds(Row, Column, NewRow, NewColumn) :-
    validate_coordinate_row(Row), 
    validate_coordinate_column(Column),
    validate_coordinate_row(NewRow),
    validate_coordinate_column(NewColumn),
    Row \= NewRow,
    Column \= NewColumn.

% verify if coordinate in row is in bounds
validate_coordinate_row(Row) :-
    Row >= 1,
    Row < 8.

% verify if coordinate in column is in bounds
validate_coordinate_column(Column) :-
    convert_letter(Column, N),
    N >= 1,
    N < 8.
  

% read_number(X):-
%     read_number_aux(X,0).


% read_number_aux(X,X).
% read_number_aux(X,Acc):- 
%     get_code(C),
%     C >= 49,
%     C =< 55,
%     !,
%     Acc1 is 10*Acc + (C - 48),
%     read_number_aux(X,Acc1).


% predicate to read a number between Min and Max until it is valid
read_until_between(Min,Max,Value):-
    repeat,
    read(Value1),
    Value1 >= Min,
    Value1 =< Max,
    !,
    Value is Value1 - 1,
    write('Valid Input!'), nl.


%convert_value/2 predicate associates a piece with a character
convert_value(empty, Piece) :- Piece = ' '.
convert_value(tile, Piece) :- Piece = 'T'.
convert_value(white_king, Piece) :- Piece = 'K'.
convert_value(white_warrior, Piece) :- Piece = 'W'.
convert_value(black_king, Piece) :- Piece = 'k'.
convert_value(black_warrior, Piece) :- Piece = 'w'.

% predicate to exchange a value from list of lists
get_value_from_board(Board, Row, Column, Piece) :-
    nth0(Row, Board, BoardRow),
    nth0(Column, BoardRow, Piece).







