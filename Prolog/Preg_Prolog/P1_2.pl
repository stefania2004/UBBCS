% 2
% a

divizor(A,0,A):-
    A\=0,!.

divizor(A,B,C):-
    B\=0,
    R is A mod B,
    divizor(B,R,C).

multiplu(A,B,M):-
    divizor(A,B,C),
    M is abs(A*B)//C.

lista([],_).
lista([X],X):-!.
lista([H|Tail],M):-
    lista(Tail,MTail),
    multiplu(H,MTail,M).

% b

putere(1).

putere(Poz):-
    Poz > 1,
    P is Poz//2,
    Poz =:= P*2,
    putere(P).

adauga(_,[],_,[]).

adauga(V,[H|Tail],Poz,[H,V|Rez]):-
    putere(Poz),
    NextPoz is Poz + 1,
    adauga(V,Tail,NextPoz,Rez).

adauga(V,[H|Tail],Poz,[H|Rez]):-
    \+ putere(Poz),
    NextPoz is Poz + 1,
    adauga(V,Tail,NextPoz,Rez).

adauga(V,L,Rez):-
    adauga(V,L,1,Rez).


