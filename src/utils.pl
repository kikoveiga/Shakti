validate_move_inbounds(Row, Column, NewRow, NewColumn) :-
    validate_coordinate_row(Row), 
    validate_coordinate_column(Column),
    validate_coordinate_row(NewRow),
    validate_coordinate_column(NewColumn).

validate_coordinate_row(Row) :-
    Row >= 1,
    Row < 8.

validate_coordinate_column(Column) :-
    convert_letter(Column, N),
    N >= 1,
    N < 8.

    


convert_letter('A', N) :- N = 1.
convert_letter('B', N) :- N = 2.
convert_letter('C', N) :- N = 3.
convert_letter('D', N) :- N = 4.
convert_letter('E', N) :- N = 5.
convert_letter('F', N) :- N = 6.
convert_letter('G', N) :- N = 7.