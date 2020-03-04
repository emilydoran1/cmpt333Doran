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