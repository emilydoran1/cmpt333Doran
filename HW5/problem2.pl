%% this program substitutes a term for another term and uses cuts
%% a cut-fail combination would not be useful because there are no conditions within the program that should explicitly make the program fail.

substitute(Old,New,Old,New).

substitute(Old,New,Term,Term) :-
    atomic(Term),
    Term \= Old.

substitute(Old,New,Term,Term1) :-
    compound(Term),
    functor(Term,F,N),
    functor(Term1,F,N),
    substitute(N,Old,New,Term,Term1).

%% a cut is placed after first recursive call and second arg call because the program does not need to backtrack after the term was substituted
substitute(N,Old,New,Term,Term1) :-
    N > 0,
    arg(N,Term,Arg),
    substitute(Old,New,Arg,Arg1),
    arg(N,Term1,Arg1),
    !,
    N1 is N-1,
    substitute(N1,Old,New,Term,Term1).

substitute(0,Old,New,Term,Term1).
