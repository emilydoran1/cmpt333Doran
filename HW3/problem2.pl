%% this program is the iterative version to calculate the Nth triangle number

%% This calls the 3 variable predicate
triangle_v2(N,T) :- triangle2(N,1,T).

%% base case when N = 1
triangle_v2(1,T,T).

%% Use accumulator and iteration to calculate triangle number keeping track of the sum counting down from N to 1
%% check to make sure N > 1
triangle_v2(N,X,T) :-
    N > 1,
    X1 is X+N,
    N1 is N-1,
    triangle_v2(N1,X1,T).
