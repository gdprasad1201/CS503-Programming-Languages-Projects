pay(Fname, Lname, Out):- salaried(Fname, Lname, Salary),
	Out is Salary.

pay(Fname, Lname, Out):- hourly(Fname, Lname, Hours, Wages),
	Hours > 50,
	Tmp is Hours - 50, Out is 2 * Wages * Tmp + 1.5 * Wages * 10 + Wages * 40.

pay(Fname, Lname, Out):- hourly(Fname, Lname, Hours, Wages),
	Hours =< 50, Hours > 40,
	Tmpp is Hours - 40, Out is 1.5 * Wages * Tmpp + Wages * 40.

pay(Fname, Lname, Out):- hourly(Fname, Lname, Hours, Wages),
	Hours =< 40,
	Out is Wages * Hours.

pay(Fname, Lname, Out):- commission(Fname, Lname, Min, Amount, Rate),
	Amount * Rate > Min,
	Out is Amount * Rate.

pay(Fname, Lname, Out):- commission(Fname, Lname, Min, Amount, Rate),
	Amount * Rate =< Min,
	Out is Min.