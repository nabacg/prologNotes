/* 
sudoku([_,_,_,2,
        _,_,_,3,
        _,_,_,1,
        _,_,_,4], Solution).

*/
use_module(library(clpfd)).

sudoku(Puzzle, Solution) :- 
    Puzzle = Solution,
    Solution = [S11, S12, S13, S14,
                S21, S22, S23, S24,
                S31, S32, S33, S34,                  
                S41, S42, S43, S44],


    Row1 = [S11, S12, S13, S14],
    Row2 = [S21, S22, S23, S24],
    Row3 = [S31, S32, S33, S34],
    Row4 = [S41, S42, S43, S44],

    Col1 = [S11, S21, S31, S41],
    Col2 = [S12, S22, S32, S42],
    Col3 = [S13, S23, S33, S43],
    Col4 = [S14, S24, S34, S44],

    Square1 = [S11, S12, S21, S22],
    Square2 = [S13, S14, S23, S24],
    Square3 = [S31, S32, S41, S42],
    Square4 = [S33, S34, S43, S44],
    valid([Row1, Row2, Row3, Row4,   
       Col1, Col2, Col3, Col4,    
       Square1, Square2, Square3, Square4]),
    Solution ins 1..4,
    clpfd:label(Solution),
    show([Row1, Row2, Row3, Row4]).

valid([]).
valid([Head|Tail]) :-
    all_different(Head),
    valid(Tail).

show([]).
show([H|T]):-
    show_row(H),
    write('|'), nl,
    show(T).

show_row([]).
show_row([H|T]):-
    write('|'),
    write(H),
    show_row(T).

