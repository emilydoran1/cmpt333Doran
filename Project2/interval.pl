%% base case
interval(X-Y,X-Y,0).

interval(Day1-Month1, Day2-Month2, Difference) :-
    interval(Day1, Day2),
    interval(Month1, Month2)

