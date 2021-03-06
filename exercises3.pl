% From Professor Moreno Falaschi at University of Siena 

% Write a program which computes the addition of integers
% in a list of integers.

sum([],0).
sum([X|L],R):- sum(L,S), R is S+X.



% Write a program which returns the element of a list L1
% which are not included in a second list L2.

list_difference([],L,[]).
list_difference([X|L1],L2,LO):- member(X,L2),            
                                list_difference(L1,L2,LO).
                      
list_difference([X|L1],L2,[X|LO]):- \+member(X,L2),    % \+ means NOT
                                    list_difference(L1, L2, LO).



% Write a Prolog program for checking if a list of integers is in ascending order

ascend([]).                              % empty list
ascend([X|[]]).                          % list with atleast one element
ascend([X,Y|L]):- X<Y, ascend([Y|L]).    % list with atleast two elements



% Write a program which decides if two binary trees are 
% equivalent.

equalTrees(t(X,T1,T2),t(X,T1,T2)).


