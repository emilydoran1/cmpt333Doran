%% This program checks if two lists contain the same elements even if they are nested


%% code from unnest_v1 to unnest the lists
%% base case
unnest_v1([],[]).

%% recursively call unnest until all elements are unnested. Then, append the unnested lists.
unnest_v1([X|List], FlatList) :-
	unnest_v1(X, Xs),
	unnest_v1(List, ListNew),
	append(Xs, ListNew, FlatList).

%% there is a single element in the List
unnest_v1(List, [List]).


%% checks if an element is a sublist
sublist([],_).
sublist([X|List1], List2):-
    member(X, List2),
    select(X, List2, List3),
    sublist(List1, List3).

%% base case if there are no elements in list
equals([],[]).

%% base case if there is one element in list
%equals([X],[X]).

%% unnests both lists, then checks if they are sublists of each other
equals(List1, List2) :-
	unnest_v1(List1, FlatList1),
	unnest_v1(List2, FlatList2),
	sublist(FlatList1, FlatList2),
<<<<<<< HEAD
	sublist(FlatList2, FlatList1),
	!.
=======
	sublist(FlatList2, FlatList1).

>>>>>>> 6650ea2f65215aea14e27f3aa5ae80b977724988
