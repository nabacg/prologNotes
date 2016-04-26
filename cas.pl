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
http://www.swi-prolog.org/man/clpqr.html
Constraint Logic Programming over Rationals and Reals
*/


solveQuadratic(X,Y) :-  { Y = X^2 - 4*X +1 } .

solveSystem(X,Y,Z) :- {X+Z=X, Z*Y=1}.