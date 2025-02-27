% 3
% a

%transforma din lista in multime
aparitii(_,[],0).
aparitii(X, [H|T], Count):-
    X = H,
    aparitii(X,T,Count_nou),
    Count is Count_nou + 1.

aparitii(X, [H|T], Count):-
    X \= H,
    aparitii(X,T,Count).

elim([],_,[]).
elim([H|Multime], Multimea_copie, [H|Rez]):-
    aparitii(H, Multimea_copie, Count),
    Count = 0,
    Multime_noua = [H|Multimea_copie],
    elim(Multime,Multime_noua,Rez).

elim([H|Multime], Multimea_copie, Rez):-
    aparitii(H, Multimea_copie, Count),
    Count > 0,
    elim(Multime,Multimea_copie,Rez).

transforma_multime(L, Rez) :-
    elim(L, [], Rez).

%b

par(X) :-
    0 is X mod 2.

descompune([],[[],[]],0,0).

descompune([H|Tail],[[H|P],I],NumP,NumI):-
    par(H),
    descompune(Tail,[P,I],NumP1,NumI1),
    NumP is NumP1 + 1,
    NumI is NumI1.

descompune([H|Tail],[P,[H|I]],NumP,NumI):-
    \+par(H),
    descompune(Tail,[P,I],NumP1,NumI1),
    NumP is NumP1,
    NumI is NumI1 + 1.

