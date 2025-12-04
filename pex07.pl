% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Elijah Sakamoto
%
% Documentation: I heavily consulted and/or copied portions of the code we were given for HWVII
%
cadet(smith).
cadet(garcia).
cadet(chen).
cadet(jones).

obj(balloon).
obj(kite).
obj(cloud).
obj(fighter).

time(friday).
time(tuesday).
time(wednesday).
time(thursday).

solve :-
    obj(tuesday_o), obj(wednesday_o), obj(thursday_o), obj(friday_o),
    all_different([tuesday_o, wednesday_o, thursday_o, friday_o]),
    
    cadet(tuesday_p), cadet(wednesday_p), cadet(thursday_p), cadet(friday_p),
    all_different([tuesday_p, wednesday_p, thursday_p, friday_p]),
    
    Triples = [ [tuesday_p, tuesday_o, tuesday],
                [wednesday_p, wednesday_o, wednesday],
                [thursday_p, thursday_o, thursday],
                [friday_p, friday_o, friday] ],
    
    \+ member([smith, balloon, _], Triples),
    \+ member([smith, kite, _], Triples),
    
    \+ member([garcia, kite, _], Triples),
    
    (member([chen, _, friday], Triples) ; 
     member([_, fighter, friday], Triples)),
    
    \+ member([_, kite, tuesday], Triples),
    
    \+ member([garcia, balloon, _], Triples),
    \+ member([jones, balloon, _], Triples),
    
    \+ member([jones, _, tuesday], Triples),
    
    member([smith, cloud, _], Triples),
    
    member([_, fighter, friday], Triples),
    
    \+ member([_, balloon, wednesday], Triples),
    
    tell(tuesday_p, tuesday_o, tuesday),
    tell(wednesday_p, wednesday_o, wednesday),
    tell(thursday_p, thursday_o, thursday),
    tell(friday_o, friday_o, friday).
    

% Succeeds if all elements of the argument list are bound and different.
% Fails if any elements are unbound or equal to some other element.
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

tell(X, Y, Z) :- 
    write("Cadet "), write(X), write(" saw the "), write(Y), 
    write(" on "), write(Z), write("."), nl.
    


% The query to get the answer(s) or that there is no answer
% ?- solve.


