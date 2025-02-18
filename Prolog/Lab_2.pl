% adauga_sf(L1:lista, L2:lista/elem, R:lista)
% model flux(i,i,o)
% L1:lista in care se insereaza L2
% L2:elem/lista de inserat in L1
% R: lista rezultat
% adauga_sf([1,2,3], [3], Rez). Rez = [1, 2, 3, 3]
% adauga_sf([1,2,3], [2,3,4], Rez). Rez = [1, 2, 3, 2, 3, 4]
adauga_sf([], L, L).

adauga_sf([H|T1], L2, [H|T3]) :-
    adauga_sf(T1, L2, T3).


% secvente_pare(L:lista, R:lista rezultat)
% model flux(i,o)
% L:lista din care extragem secventa maxima de nr pare consecutive
% R:secventa maxima de nr pare consecutive
% secvente_pare([1,2,3,2,4,6,7,2,2,2],Rez). Rez = [2, 4, 6]
% secvente_pare([1,2,3],Rez). Rez = [2]
% secvente_pare([1,3],Rez). Rez = []

secvente_pare(Lista, Rezultat):-
    vf_pare(Lista,[],[],0,0,Rezultat).


% vf_pare(L:lista, Secvente_Curenta:lista, Secvente_Max:lista,
% Lungime:intreg, Lungime_Max:intreg, Max:lista)
% model flux(i,i,i,i,i,o)
% L:lista din care extragem secventa maxima de nr pare consecutive
% Secvente_Curenta: secventa curenta de nr pare consec
% Secvente_Max: secventa maxima de nr pare consecutive
% Lungime: lungimea secventei curente
% Lungime_Max: lungimea secventei maxime
% Max: secventa finala de numere pare consecutive
% vf_pare([1,2,3,4,6,7],[],[],0,0, Rez). Rez = [4, 6]
vf_pare([],[],[],0,_,[]).

vf_pare([], Secvente_Curenta, _, Lungime, Lungime_Max, Max):-
    Lungime > Lungime_Max,
    Max = Secvente_Curenta.

vf_pare([], _, Secvente_Max, Lungime, Lungime_Max, Max):-
    Lungime =< Lungime_Max,
    Max = Secvente_Max.

vf_pare([H|T], Secvente_Curenta, Secvente_Max, Lungime, Lungime_Max, Max):-
    H mod 2 =:= 0,
    Lungime1 is Lungime + 1,
    adauga_sf(Secvente_Curenta, [H], Secventa_Noua),
	vf_pare(T, Secventa_Noua, Secvente_Max, Lungime1, Lungime_Max, Max).

vf_pare([H|T], Secvente_Curenta, _, Lungime, Lungime_Max, Max) :-
    H mod 2 =:= 1,
    Lungime > Lungime_Max,
    vf_pare(T, [], Secvente_Curenta, 0, Lungime, Max).

vf_pare([H|T], _, Secvente_Max, Lungime, Lungime_Max, Max) :-
    H mod 2 =:= 1,
    Lungime =< Lungime_Max,
    vf_pare(T, [], Secvente_Max, 0, Lungime_Max, Max).

% este_lista(e:elem/lista)
% model flux(i)
% e: elem pe care il verificam daca este lista sau numar
% este_lista([1,2,3,4]). true
% este_lista(5). false
% este_lista([]). true
este_lista([]).
este_lista([_|_]).

% inloc_secv(L:lista, Rez:lista rezultat)
% model flux(i ,o)
% L:lista eterogena din care se inloc sublistele cu cea mai lunga secv de nr pare consec din sublista rrespectiva
% Rez:lista finala
% inlocuieste_secventa([1,7,[1,2,3,4,6,8,2,3,2,2,2]],Rez). Rez =
% [1,7,[4,6,8,2]]
inlocuieste_secvente([],[]).
inlocuieste_secvente([H|T], [Rezultat | Rez]) :-
    este_lista(H),
    secvente_pare(H, Rezultat),
    inlocuieste_secvente(T, Rez).

inlocuieste_secvente([H|T], [H|Rez]) :-
    not(este_lista(H)),
    inlocuieste_secvente(T, Rez),!.
