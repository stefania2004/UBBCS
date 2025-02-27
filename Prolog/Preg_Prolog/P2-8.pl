% 8
% a

intorc([],Rez,Rez).
intorc([H|T],Rez,Final):-
    Rez_nou = [H|Rez],
    intorc(T,Rez_nou,Final).

%Flag = 0 -> nu am adunat deloc 1
succesor([],_,Tr,[Tr]):-Tr>0.
succesor([],_,0,[]).
succesor([H|T],0,Tr,[S|Rez]):-
    S is (H+1+Tr) mod 10,
    Tr_nou is floor((H+1+Tr)/10),
    succesor(T,1,Tr_nou,Rez).
succesor([H|T],1,Tr,[S|Rez]):-
    S is (H+Tr) mod 10,
    Tr_nou is floor((H+1+Tr)/10),
    succesor(T,1,Tr_nou,Rez).

trans([],0).
trans([H|T],Rez):-
    trans(T,Rez_nou),
    Rez is 10*Rez_nou+H.

principal(L,Rez):-
    intorc(L,[],L2),
    succesor(L2,0,0,R),
    trans(R,Rez).
