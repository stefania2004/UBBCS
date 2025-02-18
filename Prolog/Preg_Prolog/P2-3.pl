adaugare_s(Elem,[],[Elem]).

adaugare_s(Elem,[H|Tail],[Elem,H|Tail]):-
           Elem < H, !.

adaugare_s(Elem,[H|Tail],[H|Tail]):-
           Elem =:=H,!.

adaugare_s(Elem,[H|Tail],[H|Tail1]):-
            Elem > H,
            adaugare_s(Elem,Tail,Tail1).


sortare2([],[]).

sortare2([H|Tail],ListaSortata):-
    sortare2(Tail,SortPartial),
    adaugare_s(H,SortPartial,ListaSortata).
