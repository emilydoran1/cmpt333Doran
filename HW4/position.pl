%% this program returns a list of argument positions identifying Subterm within Term

%% base case
position(Term, Term, 1).

position(Subterm, Term, Position) :-
    subterm(Subterm, Term, Position, 1).

subterm(_, [], [], _).

subterm(Subterm, [Subterm|Term], [Position|List], Position) :-
    I1 is Position + 1,
    subterm(Subterm, Term, List, I1).

subterm(Subterm, [X|Term], List, Position) :-
    dif(X, Subterm),
    I1 is Position + 1,
    subterm(Subterm, Term, List, I1).
