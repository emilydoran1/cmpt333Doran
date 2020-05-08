%% this program solves a riddle to figure out when Carols mother was born

%% define the possible month/day for birthday
birthday_month(january, 1).
birthday_month(june, 6).
birthday_month(july, 7).

%% we know the birthday is on the 27th of some month
birthday_day(27).

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

%% define days of days of week
next_day(sunday, monday).
next_day(monday, tuesday).
next_day(tuesday, wednesday).
next_day(wednesday, thursday).
next_day(thursday, friday).
next_day(friday, saturday).
next_day(saturday, sunday).

%% define days of week according to prolog numbering
day(monday, 1).
day(tuesday, 2).
day(wednesday, 3).
day(thursday, 4).
day(friday, 5).
day(saturday, 6).
day(sunday, 7).

%% it is currently 8 years later and a monday
year_difference(8).
current_day(monday).

%% we know they were married on a weekend
%% they were married on a saturday because the difference in years is 8, so the difference in days of week should be either 9 or 10. Sunday would produce a difference of 8.
married(saturday).

%% define what makes a year a leap year
leap_year(Year) :-
    0 is Year mod 4,
    0 is Year mod 100,
    0 is Year mod 400.

leap_year(Year) :-
    0 is Year mod 4,
    X is Year mod 100,
    X \= 0.

%% start with year 1900 since we know that it was in the 1900s
riddle(Day, Month, Year) :-
    riddle(Day, Month, 1900, Year).

%% call to solve the riddle - increments year if days are not equal
riddle(Day, Month, Acc, Year) :-
    birthday_day(Day),
    not(leap_year(Acc)),
    birthday_month(Month, Num),
    next_month(Month, february),
    day(saturday, DayNum),
    day_of_the_week(date(Acc, Num, Day), WeekDay),
    WeekDay \= DayNum,
    Acc1 is Acc + 1,
    riddle(Day, Month, Acc1, Year).

%% call to solve the riddle - days of week are equal
riddle(Day, Month, Acc, Year) :-
    birthday_day(Day),
    not(leap_year(Acc)),
    birthday_month(Month, Num),
    next_month(Month, february),
    day(saturday, DayNum),
    day_of_the_week(date(Acc, Num, Day), WeekDay),
    WeekDay = DayNum,
    write('Carol\'s Mother was born on:'),
    Year is Acc + 8.
