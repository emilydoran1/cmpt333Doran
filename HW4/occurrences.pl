%% this program returns the number of occurrences of subterm Sub in Term

%% define the subterm predicate first

%% base case - they are the same
subterm(Term,Term).

%% call the 3 variable predicate
subterm(Sub,Term) :-
    compound(Term), functor(Term, F, N), subterm(N,Sub,Term).

%% checks if Sub is a subterm of Term
subterm(N,Sub,Term) :-
    N > 1, N1 is N-1, subterm(N1,Sub,Term).

subterm(N,Sub,Term) :-
    arg(N,Term,Arg), subterm(Sub,Arg).

%% base case - they are the same term
occurrences(Term, Term, 1).

%% calls subterm to count the number of occurrences of Sub in Term
occurrences(Sub, Term, N) :-
    State = occurrences(0),
   (subterm(Sub, Term),
        arg(1, State, N0),
        N is N0 + 1,
        nb_setarg(1, State, N),
        fail;
    arg(1, State, N)
    ).

