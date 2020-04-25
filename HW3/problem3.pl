%% this program uses a counter to find the length of a list

%% This calls the 3 variable predicate
list_length(List,Length) :- list_length(List,0,Length).

%% base case when list is empty
list_length([],T,T).

%% uses a counter to find the length of a non-empty list
list_length([X|List], Count, Length) :-
    Count1 is Count+1,
    list_length(List, Count1, Length).
