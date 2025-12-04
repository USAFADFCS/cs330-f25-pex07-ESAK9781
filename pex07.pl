% pex5.pl
% USAFA UFO Sightings 2024
%
% name: 
%
% Documentation: 
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
    obj(smith_o), obj(garcia_o), obj(chen_o), obj(jones_o),
    all_different([smith_o, garcia_o, chen_o, jones_o]),
    
    time(smith_t), time(garcia_t), time(chen_t), time(jones_t),
    all_different([smith_t, garcia_t, chen_t, jones_t]),
    
    Triples = [ [smith, smith_o, smith_t],
                [garcia, garcia_o, garcia_t],
                [chen, chen_o, chen_t],
                [jones, jones_o, jones_t] ],
    
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
    
    tell(smith, smith_o, smith_t),
    tell(garcia, garcia_o, garcia_t),
    tell(chen, chen_o, chen_t),
    tell(jones, jones_o, jones_t).
    

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


