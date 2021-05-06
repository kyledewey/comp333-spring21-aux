% this is a comment

% arity: the number of parameters to a procedure

% isInteger/2 procedure
%% isInteger(0, 1).
%% isInteger(1, 2).

% isInteger/1 procedure
isInteger(2). % fact
isInteger(1). % fact
isInteger(0). % fact

% Prolog: closed-world assumption
% All the facts (and rules) you give it describe all truth.
% Anything not in those facts in rules is false.

% areEqual/2 procedure
areEqual(X, X). % fact: any X is equal to itself

% isName/1 procedure
isName(kyle).   % fact
isName(janet).  % fact
isName(bob).    % fact
isName(alice).  % fact

isWarm(pizza).
isWarm(burgers).
isWarm(burritos).


likes(alice,pizza).
likes(alice,burgers).
likes(alice,burritos).
likes(alice,yogurt).
likes(alice,pizza).
likes(bob,pizza).
likes(bob,burgers).
likes(bob,salad).
likes(bob,milk).
likes(bill, Food):-
    isWarm(Food).
likes(janet, Food):-
    likes(alice, Food),
    likes(bob, Food).
likes(yogurt, mel).
likes(Food, mel) :-
    likes(Food, janet).

% inclusive range
%% between5And10(5).
%% between5And10(6).
%% between5And10(7).
%% between5And10(8).
%% between5And10(9).
%% between5And10(10).

% between5And10/1 procedure
between5And10(Number) :-
    inRange(Number, 5, 10).

% inRange(Number, Min, Max) <= (Min <= Number && Number =< Max).  % q <= p
% (Min <= Number && Number =< Max) => inRange(Number, Min, Max).  % p => q

% inRange/3 procedure
%% inRange(0, 0, 0).
inRange(Number, Min, Max) :-
    Min =< Number, % one clause
    Number =< Max. % checks if Number is <= Max
