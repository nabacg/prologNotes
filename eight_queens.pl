
eight_queens(Board) :-
    Board = [(1, _), (2, _), (3, _), (4, _), (5, _), (6, _), (7, _), (8, _)],
    valid_board(Board),
    rows(Board, Rows), all_distinct(Rows),
    cols(Board, Cols), all_distinct(Cols),
    diags1(Board, ds1), all_distinct(ds1),
    diags2(Board, ds2), all_distinct(ds2).

valid_queen((_, Column)) :-
    member(Column, [1,2,3,4,5,6,7,8]).

valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).

rows([], []).
rows([(Row, _)|QueensTail], [Row|RowsTail]) :- 
    rows(QueensTail, RowsTail).

cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :- 
    cols(QueensTail, ColsTail).


diags1([], []).
diags1([(Row, Col)|QueensTail], [Diag|DiagTails]) :-
    Diag is Col - Row,
    diags1(QueensTail, DiagTails).

diags2([], []).
diags2([(Row, Col)|QueensTail], [Diag|DiagTails]) :-
    Diag is Col + Row,
    diags2(QueensTail, DiagTails).