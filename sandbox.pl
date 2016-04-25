

father(john, adam).
father(adam, stefan).
father(adam, eve).
mother(eve, petunia).
mother(anna, adam).
/*
Mandatory Prolog hello world program, the ancestor
 */
ancestor(X, Y) :- father(X, Y).
ancestor(X, Y) :- mother(X, Y).
ancestor(X, Y) :- father(X, Z), ancestor(Z, Y).
ancestor(X, Y) :- mother(X, Z), ancestor(Z, Y).


count(0, []).
count(Count, [_|Tail]) :- count(CountRest, Tail), Count is CountRest + 1.

sum(0, []).
sum(Total, [Head|Tail]) :- sum(TotalRest, Tail), Total is TotalRest + Head.


average(Avg, Xs) :- sum(Sum, Xs), count(Count, Xs), Avg is Sum/Count.


/* list comprehensions, i.e. [1..10] 
findall(X, between(1,10, X), Xs).
*/
/* Use labeling to generate all possible X and Y from domain (10..20) satisfying conditions (min, max) 
more here http://www.swi-prolog.org/pldoc/doc_for?object=labeling/2

[X, Y] ins 10..20, labeling([max(X), min(Y)], [X, Y]).
*/
/* add 2 lists 
append([oil], [water], X).


/* remove first from last 2 lists */
append([oil], [water], [oil, water]).

append([oil], X, [oil, rest, tada]).
/* X = [rest, tada]. */

/* And it computes possible splits: */ 

    
    append(One, Two, [apples, oranges, bananas]).

*/

concatenate([], List, List).
concatenate([X|Xs], Ys, [X|Zs]) :- concatenate(Xs, Ys, Zs).

myreverse([], []).
myreverse([X|Xs], R) :- myreverse(Xs, Ys), append(Ys, [X], R).

/* maplist to check if matrix is square 

maplist(same_length([1,2,3]), [[12,32,12], [1,2,3], [23,4213, 23]]).
maplist(same_length([1,2,3]), [[12,32,12], [1,2,3], [23]]).

maplist(plus(1), [1,2,3], Result).
*/


/* reduce 

foldl(plus, [1,2,3,4], 0, R).
findall(X, between(1, 100, X), Xs), foldl(plus, Xs, 0, R).
*/

/* Using Prolog for solving equation */
:- use_module(library(clpfd)).
:- use_module(library(clpr)).

findSqrt(X, Sqrt) :- Sqrt*Sqrt #= X. 
solveEq(X, Y) :- Y #= X*X * 2 + 10.


solve(X,Y,Z) :- {X+Z=X, Z*Y=1}.

