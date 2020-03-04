%% This program unnests a list using an accumulator

unnest_v1([],[]).

unnest_v1([X|List], FlatList) :- 
	unnest_v1(X, Xs),
	unnest_v1(List, ListNew),
	append(Xs, ListNew, FlatList).

unnest_v1(List, [List]).