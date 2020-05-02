%% define the quicksort predicate
quicksort([X|Xs], Ys) :-
    partition(Xs, X, Littles, Bigs),
    quicksort(Littles, Ls),
    quicksort(Bigs, Bs),
    append(Ls, [X|Bs], Ys).

quicksort([],[]).

%% define the partition predicate adding cuts before the calls back to partition
partition([X|Xs], Y, [X|Ls], Bs) :-
    X =< Y,
    !,
    partition(Xs, Y, Ls, Bs).

partition([X|Xs], Y, Ls, [X|Bs]) :-
    X > Y,
    !,
    partition(Xs, Y, Ls, Bs).
          
partition([], Y, [], []).
