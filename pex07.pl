% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Elijah Sakamoto
%
% Documentation: I heavily consulted and/or copied portions of the code we were given for HWVII. Will looked over my code and reminded me that Prolog is case sensitive.
% I fixed my variables to be lower case after this feedback.
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
    obj(Tuesday_o), obj(Wednesday_o), obj(Thursday_o), obj(Friday_o),
    all_different([Tuesday_o, Wednesday_o, Thursday_o, Friday_o]),
    
    cadet(Tuesday_p), cadet(Wednesday_p), cadet(Thursday_p), cadet(Friday_p),
    all_different([Tuesday_p, Wednesday_p, Thursday_p, Friday_p]),
    
    Triples = [ [Tuesday_p, Tuesday_o, tuesday],
                [Wednesday_p, Wednesday_o, wednesday],
                [Thursday_p, Thursday_o, thursday],
                [Friday_p, Friday_o, friday] ],
    
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
    
    tell(Tuesday_p, Tuesday_o, tuesday),
    tell(Wednesday_p, Wednesday_o, wednesday),
    tell(Thursday_p, Thursday_o, thursday),
    tell(Friday_o, Friday_o, friday).
    

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

