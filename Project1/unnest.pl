%% This program unnests a list using append

%% base case
unnest_v1([],[]).

%% recursively call unnest until all elements are unnested. Then, append the unnested lists.
unnest_v1([X|List], FlatList) :- 
	unnest_v1(X, Xs),
	unnest_v1(List, ListNew),
	append(Xs, ListNew, FlatList).

%% there is a single element in the List
unnest_v1(List, [List]).


%% This program unnests a list using an accumulator

%% This calls the 3 variable predicate  
unnest_v2(List, FlatList) :- unnest_v2(List, [], FlatList).

%% base case if an empty list is entered 
unnest_v2([], FlatList, FlatList).

%% recursive function to unnest list
%% first unnests List, then unnests X (head) using List2 as accumulator
unnest_v2([X|List], Acc, FlatList) :- 
	unnest_v2(List, Acc, List2),
	unnest_v2(X, List2, FlatList).

%% handles case when X is not an empty list or a list
unnest_v2(X, Acc,[X|Acc]) :-
    X \= [],
    X \= [_|_].
