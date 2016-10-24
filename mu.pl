% last element of a list
last([Elem], Elem).
last([_|Tail], Elem) :- last(Tail, Elem).

% rule 1
rule(X, Y) :-
  last(X, i), append(X, [u], Y).

% rule 2
rule([m|X], [m|Y]) :-
  append(X, X, Y).

% rule 3
rule(X, Y) :-
  append(X1, [i, i, i|X2], X), append(X1, [u|X2], Y).

% rule 4
rule(X, Y) :-
  append(X1, [u, u|X2], X), append(X1, X2, Y).

solve(X, Y) :-
  rule(X, Y).
solve(X, Z) :-
  solve(X, Y), rule(Y, Z).

thm([m,i]).
thm(X) :-
  thm(Y), rule(Y, X).
