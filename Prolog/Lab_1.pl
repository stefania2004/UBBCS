%a

/* substituie(L: lista, E: element, NL: lista, R: lista)
 * Model de flux: (i, i, i, o)
 * L: lista originală din care vrem să substituim elemente.
 * E: elementul care trebuie înlocuit.
 * NewList: elementul cu care înlocuim fiecare apariție a
 * R: lista rezultată după substituirea lui E cu NL.
*/

substituie([],_,_,[]).
substituie([H], H, L, L).
substituie([Elem|Tail], Elem, NewList,[NewList| Rezultat]) :-
    substituie(Tail, Elem, NewList, Rezultat),!.

substituie([H|Tail], Elem, NewList, [H|RezultatTail]) :-
    substituie(Tail, Elem, NewList, RezultatTail).


%b

/* sterge(L: lista, N: numar, R: lista)
 * Model de flux: (i, i, o)
 * L: lista inițială din care se șterge un element.
 * N: poziția elementului care trebuie șters (1-indexat).
 * R: lista rezultată după ștergerea elementului de la poziția N.
 */

sterge([],_,[]).

sterge([_|Tail], 1, Tail).

sterge([H|Tail], N, [H|RezultatTail]) :-
    N>1,
    N1 is N - 1,
    sterge(Tail, N1, RezultatTail).



