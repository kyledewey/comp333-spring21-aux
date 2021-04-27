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

% fact: any X is equal to itself
areEqual(X, X).
