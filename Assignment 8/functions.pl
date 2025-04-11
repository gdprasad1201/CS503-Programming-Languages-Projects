count(Op, Ref, Count):-(
	Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List), length(List, Count);
	Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List), length(List, Count);
	Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List), length(List, Count);
	Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List), length(List, Count);
	Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List), length(List, Count);
	Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List), length(List, Count)
	).

min(Op, Ref, Min):-(
	Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List), minList(List, Min);
	Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List), minList(List, Min);
	Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List), minList(List, Min);
	Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List), minList(List, Min);
	Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List), minList(List, Min);
	Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List), minList(List, Min)
	).

max(Op, Ref, Max):-(
	Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List), maxList(List, Max);
	Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List), maxList(List, Max);
	Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List), maxList(List, Max);
	Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List), maxList(List, Max);
	Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List), maxList(List, Max);
	Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List), maxList(List, Max)
	).

avg(Op, Ref, Avg):-(
	Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List), 
		(length(List, Len), sumList(List, Sum), 
		(Len > 0 -> Avg is Sum / Len; Avg is 0));
	Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),
		(length(List, Len), sumList(List, Sum), 
		(Len > 0 -> Avg is Sum / Len; Avg is 0));
	Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),
		(length(List, Len), sumList(List, Sum), 
		(Len > 0 -> Avg is Sum / Len; Avg is 0));
	Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),
		(length(List, Len), sumList(List, Sum), 
		(Len > 0 -> Avg is Sum / Len; Avg is 0));
	Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),
		(length(List, Len), sumList(List, Sum), 
		(Len > 0 -> Avg is Sum / Len; Avg is 0));
	Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),
		(length(List, Len), sumList(List, Sum), 
		(Len > 0 -> Avg is Sum / Len; Avg is 0))
	).

total(Op, Ref, Total):-(
	Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List), sumList(List, Total);
	Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List), sumList(List, Total);
	Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List), sumList(List, Total);
	Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List), sumList(List, Total);
	Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List), sumList(List, Total);
	Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List), sumList(List, Total)
	).

list(Op, Ref, List):-(
	Op=('=='), findall([X, Y, Z], (pay(X, Y, Z), Z=:=Ref), List);
	Op=('!='), findall([X, Y, Z], (pay(X, Y, Z), Z=\=Ref), List);
	Op=('>'), findall([X, Y, Z], (pay(X, Y, Z), Z>Ref), List);
	Op=('>='), findall([X, Y, Z], (pay(X, Y, Z), Z>=Ref), List);
	Op=('<'), findall([X, Y, Z], (pay(X, Y, Z), Z<Ref), List);
	Op=('<='), findall([X, Y, Z], (pay(X, Y, Z), Z=<Ref), List)
	).