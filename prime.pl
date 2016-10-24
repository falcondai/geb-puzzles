% TNT system.
% represents natural number n by n dashs
% define primality

% dnd(X, Y) = X does not divide Y
dnd([-|Z], [-|X]) :-
  append([-|X], [-|Y], [-|Z]).

dnd([-|X], [-|Y]) :-
  dnd([-|X], [-|Z]), append([-|X], [-|Z], [-|Y]).

% df(X, Y) = X is divisor-free up to Y
df(Z, [-,-]) :-
  dnd([-,-], Z).

df(X, [-,-,-|Y]) :-
  dnd([-,-,-|Y], X), df(X, [-,-|Y]).

prime([-,-]).
prime([-|X]) :-
  df([-|X], X).
