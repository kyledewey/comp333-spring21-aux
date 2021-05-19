% F_0 = 0
% F_1 = 1
% F_N = F_(N - 1) + F_(N - 2), N > 1

% fib(n) = fib(n - 1) + fib(n - 2)
% fib(n) = {
%   if (n == 0) {
%     return 0
%   } else if (n == 1) {
%     return 1
%   } else {
%     let temp1 = n - 1
%     let temp2 = n - 2
%     let left = fib(temp1)
%     let right = fib(temp2)
%     return left + right
%   }
% }

% fib/2 procedure
% fib: PositionInSequence, Value
fib(0, 0).
fib(1, 1).
fib(N, Result) :-
    % N = 0
    N > 1, % mutual exclusion with the base cases
    Temp1 is N - 1,
    Temp2 is N - 2,
    fib(Temp1, Left),
    fib(Temp2, Right),
    Result is Left + Right.

factorial(0, 1).
factorial(N, Result) :-
    N > 0,
    Next is N - 1,
    factorial(Next, Right),
    Result is N * Right.

% func append<A>(list1: List<A>, list2: List<A>) -> List<A> {
%   switch list1 {
%     case .cons(let head, let tail):
%       return .cons(head, append(list1: tail, list2: list2))
%     case .empty:
%       return list2
%   }
% }

% myAppend: InputList1, InputList2, OutputList
myAppend(nil, List, List).
myAppend(cons(Head, Tail), List, cons(Head, RestResult)) :-
    myAppend(Tail, List, RestResult).
