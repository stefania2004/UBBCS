% Sa se inlocuiasca elementul maxim cu un alt numar

max([],Max,Max).

max([H|Tail],MaxC,Max):-
    H > MaxC,
    max(Tail,H,Max).

max([H|Tail],MaxC,Max):-
    H =< MaxC,
    max(Tail,MaxC,Max).


inloc([], _, _, []).

inloc([H|T], Elem, Val, [H|Rez]) :-
	H \= Elem,
	inloc(T, Elem, Val, Rez).

inloc([H|T], Elem, Val, [Val|Rez]) :-
	H = Elem,
	inloc(T, Elem, Val, Rez).

rezolva([H|T], Val, Rez) :-
	max(T, H, ElemMax),
	inloc([H|T], ElemMax, Val, Rez).
