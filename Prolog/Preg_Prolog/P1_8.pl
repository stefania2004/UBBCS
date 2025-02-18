% 8
% a

vf_lista([]).
vf_lista([H|Tail]) :-
    \+ multime(H, Tail),
    vf_lista(Tail).

multime(X, [X|_]).
multime(X, [_|Tail]) :-
    multime(X, Tail).

% b

elimina_ap(_,[],[]).

elimina_ap(X,[X|Tail],Rez):-
    elimina_apa(X,Tail,Rez,3).

elimina_apa(_,[],[],_).

elimina_apa(_,L,L,0).

elimina_apa(X,[X|Tail],Rez,N):-
    N>0,
    N1 is N-1,
    elimina_apa(X,Tail,Rez,N1).

elimina_apa(X,[H|Tail],[H|Rez],N):-
    elimina_apa(X,Tail,Rez,N),!.



