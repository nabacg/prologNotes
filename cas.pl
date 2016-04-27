/* Using Prolog for solving equation */
:- use_module(library(clpfd)).
:- use_module(library(clpr)).
:- use_module(library(quintus)).




/*
Constraint Logic Programming over Finite Domains

http://www.swi-prolog.org/pldoc/man?section=clpfd 

*/
findSqrt(X, Sqrt) :- Sqrt*Sqrt #= X. 
solveEq(X, Y) :- Y #= X*X * 2 + 10.

solve2(X,Y,A) :- A #= 2*X + Y ^ 3.

solve3 :- X #> 3, X #= 5 + 2.

/*
A well-known puzzle is
  S E N D
+ M O R E
M O N E Y
• 

The task is to find digits for the letters (all different,
S and M not zero) such that this addition
gives the correct result.


to solve 

?- sendMoneyPuzzle(A, B, C), label(A).
*/

sendMoneyPuzzle([S, E, N, D], [M, O, R, E], [M, O, N, E, Y]) :- 
    Vars = [S, E, N, D, M, O, R, Y],
    Vars ins 0..9,
    all_different(Vars),
    S * 1000 + E * 100 + N * 10 + D + M * 1000 + O * 100 + R * 10 + E #= M *10000 + O * 1000 + N * 100 + E * 10 + Y,
        M #\= 0, 
        S #\= 0.

/*  
http://www.swi-prolog.org/man/clpqr.html
Constraint Logic Programming over Rationals and Reals
*/

/* solve system of equations */ 
p(X, Y) :- {X = Y * 3}, q(X, Y).
q(X, Y) :- {X - 2 = Y}.

solveQuadratic(X,Y) :-  { Y = X^2 - 4*X +1 } .
