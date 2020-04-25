%% this program returns a list of argument positions identifying Subterm within Term

%% base case
position(Term, Term, 1).

%% call subterm predicate to get all positions of Term
position(Subterm, Term, Position) :-
    subterm(Subterm, Term, Position, 1).

%% define the subterm predicate to create an array of the positions of all positions of Term

%% base case - empty Term is entered
subterm(_, [], [], _).

subterm(Subterm, [Subterm|Term], [Position|List], Position) :-
    NextPosition is Position + 1,
    subterm(Subterm, Term, List, NextPosition).

subterm(Subterm, [X|Term], List, Position) :-
    dif(X, Subterm),
    NextPosition is Position + 1,
    subterm(Subterm, Term, List, NextPosition).
