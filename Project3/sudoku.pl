%% this program solves a 9x9 sudoku puzzle

%% use clpfd library to reduce time and to make sure that all variables are distinct
:- use_module(library(clpfd)).

%% takes in an unsolved sudoku puzzle and prints the solved puzzle
sudoku(Puzzle):-
    solve_puzzle(Puzzle),
    forall(member(Row,Puzzle), (print(Row),nl)).

%% define the predicate to solve sudoku puzzle
solve_puzzle([[R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9],
        [R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9],
        [R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9],
        [R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9],
        [R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9],
        [R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9],
        [R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9],
        [R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9],
        [R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9]]):-

    %% define the variables
    Variables = [R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9,
            R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9,
            R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9,
            R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9,
            R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9,
            R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9,
            R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9,
            R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9,
            R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9],

    %% set values for variables to be numbers 1-9
    Variables ins 1..9,

    %% Make sure that all variables in rows are distinct
    all_different([R1C1, R1C2, R1C3, R1C4, R1C5, R1C6, R1C7, R1C8, R1C9]),
    all_different([R2C1, R2C2, R2C3, R2C4, R2C5, R2C6, R2C7, R2C8, R2C9]),
    all_different([R3C1, R3C2, R3C3, R3C4, R3C5, R3C6, R3C7, R3C8, R3C9]),
    all_different([R4C1, R4C2, R4C3, R4C4, R4C5, R4C6, R4C7, R4C8, R4C9]),
    all_different([R5C1, R5C2, R5C3, R5C4, R5C5, R5C6, R5C7, R5C8, R5C9]),
    all_different([R6C1, R6C2, R6C3, R6C4, R6C5, R6C6, R6C7, R6C8, R6C9]),
    all_different([R7C1, R7C2, R7C3, R7C4, R7C5, R7C6, R7C7, R7C8, R7C9]),
    all_different([R8C1, R8C2, R8C3, R8C4, R8C5, R8C6, R8C7, R8C8, R8C9]),
    all_different([R9C1, R9C2, R9C3, R9C4, R9C5, R9C6, R9C7, R9C8, R9C9]),

    %% Make sure that all variables in columns are distinct
    all_different([R1C1, R2C1, R3C1, R4C1, R5C1, R6C1, R7C1, R8C1, R9C1]),
    all_different([R1C2, R2C2, R3C2, R4C2, R5C2, R6C2, R7C2, R8C2, R9C2]),
    all_different([R1C3, R2C3, R3C3, R4C3, R5C3, R6C3, R7C3, R8C3, R9C3]),
    all_different([R1C4, R2C4, R3C4, R4C4, R5C4, R6C4, R7C4, R8C4, R9C4]),
    all_different([R1C5, R2C5, R3C5, R4C5, R5C5, R6C5, R7C5, R8C5, R9C5]),
    all_different([R1C6, R2C6, R3C6, R4C6, R5C6, R6C6, R7C6, R8C6, R9C6]),
    all_different([R1C7, R2C7, R3C7, R4C7, R5C7, R6C7, R7C7, R8C7, R9C7]),
    all_different([R1C8, R2C8, R3C8, R4C8, R5C8, R6C8, R7C8, R8C8, R9C8]),
    all_different([R1C9, R2C9, R3C9, R4C9, R5C9, R6C9, R7C9, R8C9, R9C9]),

    %% Make sure that all variables in 3x3 boxes are distinct
    all_different([R1C1, R2C1, R3C1, R1C2, R2C2, R3C2, R1C3, R2C3, R3C3]),
    all_different([R1C4, R2C4, R3C4, R1C5, R2C5, R3C5, R1C6, R2C6, R3C6]),
    all_different([R1C7, R2C7, R3C7, R1C8, R2C8, R3C8, R1C9, R2C9, R3C9]),
    all_different([R4C1, R5C1, R6C1, R4C2, R5C2, R6C2, R4C3, R5C3, R6C3]),
    all_different([R4C4, R5C4, R6C4, R4C5, R5C5, R6C5, R4C6, R5C6, R6C6]),
    all_different([R4C7, R5C7, R6C7, R4C8, R5C8, R6C8, R4C9, R5C9, R6C9]),
    all_different([R7C1, R8C1, R9C1, R7C2, R8C2, R9C2, R7C3, R8C3, R9C3]),
    all_different([R7C4, R8C4, R9C4, R7C5, R8C5, R9C5, R7C6, R8C6, R9C6]),
    all_different([R7C7, R8C7, R9C7, R7C8, R8C8, R9C8, R7C9, R8C9, R9C9]),

    label(Variables).
