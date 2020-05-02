%% this file Modifies the log program so that the user can specify the destination file of the logged output.

%% read the string for file name
read_string(String) :-
    current_input(Input),
    read_line_to_codes(Input, Codes),
    string_codes(String, Codes).

%% Log command - gets file name from user input
log :-
    write('Enter the file name where you would like to store the log:'),
    nl,
    read_string(FileName),
    open(FileName,append,Fd),
    shell(log,Fd).

% Shell command modified for SWI-Prolog
shell(Flag) :-
    shell_prompt,
    shell_read(Goal,Flag),
    shell(Goal,Flag).

% This is the command when logging
shell(log,Fd) :-
    shell_prompt,
    shell_read(Goal,log,Fd),
    shell(Goal,log,Fd).

shell(Goal,Flag) :-
    ground(Goal),
    !,
    shell_solve_ground(Goal,Flag),
    shell(Flag).

shell(nolog,_) :-
    shell(nolog).

shell(Goal,Flag) :-
    shell_solve(Goal,Flag),
    shell(Flag).

shell(exit,log,Fd) :-
    close_logging_file(Fd).

shell(log,_,Fd) :-
    shell(log,Fd).

shell(Goal,log,Fd) :-
    ground(Goal),
    !,
    shell_solve_ground(Goal,log,Fd),
    shell(log,Fd).

shell(Goal,log,Fd) :-
    shell_solve(Goal,log,Fd),
    shell(log,Fd).

shell_solve(Goal,Flag) :-
    Goal,
    shell_write(Goal,Flag),
    nl,
    fail.

shell_solve(_,Flag) :-
    shell_write('No (more) solutions',Flag),
    nl.

shell_solve(Goal,log,Fd) :-
    Goal,
    shell_write(Goal,log,Fd),
    nl,
    fail.

shell_solve_ground(Goal,Flag) :-
    Goal,
    !,
    shell_write('Yes',Flag),
    nl.

shell_solve_ground(_,Flag) :-
    shell_write('No',Flag),
    nl.

shell_solve_ground(Goal,log,Fd) :-
    Goal,
    !,
    shell_write('Yes',log,Fd),
    nl(Fd).

shell_prompt :- write('Next command? ').

shell_read(X,log,Fd) :-
    read(X),
    nl,
    file_write(['Next command? ',X],Fd),
    nl(Fd).

shell_read(X,nolog) :- read(X).

shell_write(X,nolog) :- write(X).

shell_write(X,log,Fd) :-
    write(X),
    file_write(X,Fd),
    nl,
    nl(Fd).

file_write(X,File) :- write_term(File,X,[ ]).

close_logging_file(Fd) :- close(Fd).
