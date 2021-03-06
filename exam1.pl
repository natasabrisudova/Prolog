% From Professor Moreno Falaschi at University of Siena 
% EXERCISE 1) Write a Prolog program ‘ascendingorder(L,N,M,LO)’ that given a list 
% of integers L, ordered in ascending order with possible repetitions 
% of values, and two integer numbers N, M, 
% returns an ordered list LO containing all elements in L plus N and M,
% without repetitions.
% So, for instance ascendingorder([-5,-3,0,1,1,4,7],7,2,[-5,-3,0,1,2,4,7]) is true.

remove_duplicates([],[]).
remove_duplicates([H|T],R) :- member(H,T), !,
                              remove_duplicates(T,R).
remove_duplicates([H|T],[H|R]) :- remove_duplicates(T,R).

insert(X,[],[X]).
insert(X,[Y|T],[X,Y|T]) :- X<Y,!.
insert(X,[Y|T0],[Y|T])  :- insert(X,T0,T).
    
ascendingorder(L,N1,N2,LO):- insert(N1,L,L1),
                             insert(N2,L1,L2),
                             remove_duplicates(L2,LO).
                             

% --------------------------- OTHER SOLUTION---------------------------------------

ascendingorder(L,N1,N2,LO) :- N1=<N2,
                              merge(L,[N1,N2],L1),
                              remove_duplicates(L1,LO).
ascendingorder(L,N1,N2,LO) :- N1>N2,
                              merge(L,[N2,N1],L1),
                              remove_duplicates(L1,LO).                              
                              
