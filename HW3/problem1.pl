%% this program calculates the Nth triangle number

%% base case when N = 1
triangle_v1(1, 1).

%% recursively call function for N-1 and then add N to triangle of N-1
%% check to make sure N > 1
triangle_v1(N, T) :-
    N > 1,
    N1 is N-1,
    triangle_v1(N1, T1),
    T is N+T1.
