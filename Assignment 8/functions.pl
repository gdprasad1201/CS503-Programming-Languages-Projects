filter(X, '==', Y) :- X =:= Y.
filter(X, '!=', Y) :- X =\= Y.
filter(X, '>', Y) :- X > Y.
filter(X, '>=', Y) :- X >= Y.
filter(X, '<', Y) :- X < Y.
filter(X, '<=', Y) :- X =< Y.

% Check if Avg whether the average pay of the employees in the sublist. 
avg(Op, Ref, Avg) :- (
    total(Op, Ref, Sum), count(Op, Ref, Count), Avg is Sum / Count
).

% Check whether Count is the number of employees in the sublist.
count(Op, Ref, Count) :- (
    list(Op, Ref, List), length(List, Count)
).

% Check whether List is the list of employees in the sublist.
list(Op, Ref, List) :- (
    % findall(Pay, (pay(First, Last, Pay), filter(Pay, Op, Ref)), List)
    findall([First, Last, Pay], (pay(First, Last, Pay), filter(Pay, Op, Ref)), List)
).

% Check whether Max is the maximum pay of the employees in the sublist.
max(Op, Ref, Max) :- (
    findall(Pay, (pay(First, Last, Pay), filter(Pay, Op, Ref)), List), max_list(List, Max)
).

% Check whether Min is the minimum pay of the employees in the sublist.
min(Op, Ref, Min) :- (
    findall(Pay, (pay(First, Last, Pay), filter(Pay, Op, Ref)), List), min_list(List, Min)
).

% Check whether Sum is the total pay of the employees in the sublist.
% The sum of the list is the total pay of the employees in the sublist.
total(Op, Ref, Sum) :- (
    findall(Pay, (pay(First, Last, Pay), filter(Pay, Op, Ref)), List), sum_list(List, Sum)
).