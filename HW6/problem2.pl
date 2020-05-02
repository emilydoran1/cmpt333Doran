%% this program handles moving the cursor down N lines

%% redefine edit to be myedit since prolog already has an edit function
edit :- myedit(file([ ],[ ])).

myedit(File) :-
    write_prompt,
    read(Command),
    edit(File,Command).

edit(_,exit) :- !.

edit(File,Command) :-
    apply(Command,File,File1),
    !,
    myedit(File1).

edit(File, Command) :-
    writeln([Command,' is not applicable']),
    !,
    myedit(File).

apply(up,file([X|Xs],Ys),file(Xs,[X|Ys])).

%% apply command to move up N lines
apply(up(N),file(Xs,Ys),file(Xsl,Ysl)) :-
    N > 0,
    up(N,Xs,Ys,Xsl,Ysl).

%% apply command to move down N lines
apply(down(N),file(Xs,Ys),file(Xsl,Ysl)) :-
    N > 0,
    down(N,Xs,Ys,Xsl,Ysl).

apply(down,file(Xs,[Y|Ys]),file([Y|Xs],Ys)).

apply(insert(Line),file(Xs,Ys),file(Xs,[Line|Ys])).

apply(delete,file(Xs,[_|Ys]),file(Xs,Ys)).

%% print current cursor location in file
apply(print,file([X|Xs],Ys),file([X|Xs],Ys)) :-
    write(X),
    nl.

%% print whole file
apply(print(*),file(Xs,Ys),file(Xs,Ys)) :-
    reverse(Xs,Xsl),
    write_file(Xsl),
    write_file(Ys).

%% implement cursor move down N lines
down(_,Ys,[ ],Ys,[ ]).

down(0,Xs,Ys,Xs,Ys).

down(N,Xs,[Y|Ys],Xs1,Ys1) :-
     Nl is N+1,
     down(Nl,[Y|Xs],Ys,Xs1,Ys1).

%% move cursor up N lines
up(_,[ ],Ys,[ ],Ys).

up(0,Xs,Ys,Xs,Ys).

up(N,[X|Xs],Ys,Xs1,Ys1) :-
    N > 0,
    Nl is N-1,
    up(Nl,Xs,[X|Ys],Xs1,Ys1).

write_file([X|Xs]) :-
    write(X), nl,
    write_file(Xs).
write_file([ ]).

write_prompt :- write('>>'), nl.
