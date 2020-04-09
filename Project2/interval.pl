%% this program returns the difference in days between two dates

%% declare the number of days in each month
month(january, 31).
month(february, 28).
month(march, 31).
month(april, 30).
month(may, 31).
month(june, 30).
month(july, 31).
month(august, 31).
month(september, 30).
month(october, 31).
month(november, 30).
month(december, 31).

%% declare the next months
next_month(january, february).
next_month(february, march).
next_month(march, april).
next_month(april, may).
next_month(may, june).
next_month(june, july).
next_month(july, august).
next_month(august, september).
next_month(september, october).
next_month(october, november).
next_month(november, december).
next_month(december, january).

%% call the 4-variable predicate from the 3-variable predicate
interval(Day1-Month1, Day2-Month2, Difference) :-
    interval(Day1-Month1, Day2-Month2, 0, Difference).

%% base case - dates are the same
interval(Day-Month, Day-Month, Acc, Acc).

%% dates are in the same month
interval(Day1-Month, Day2-Month, _, Difference) :-
    Day1 =< Day2,
    Difference is Day2 - Day1.

%% recursively call function adding to Acc until the dates are equal, then will return Difference
interval(Day1-Month1, Day2-Month2, Acc, Difference):-
    Month1 \= Month2,
    month(Month1, Days),
    Acc1 is Acc + Days - Day1 + Day2,
    next_month(Month1, NextMonth),
    interval(Day2-NextMonth, Day2-Month2, Acc1, Difference).
