% 9
% a

intersectie([], _, []).

intersectie([H|Tail], Y, [H|XTail]) :-
    exista(H, Y),!,
    intersectie(Tail, Y, XTail).

intersectie([H|Tail], Y, XTail) :-
    \+ exista(H, Y),
    intersectie(Tail, Y, XTail).

exista(_, []).

exista(X, [X|_]).

exista(X, [_|Tail]) :-
    exista(X, Tail).


% b

interval(M, N, [M|Tail]) :-
    M =< N,
    M1 is M + 1,
    interval(M1, N, Tail).

interval(M, N, []) :-
    M > N.
