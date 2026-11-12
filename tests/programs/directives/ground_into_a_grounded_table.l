# A predicate grounded into another grounded predicate's table, itself
# named otherwise (`@Ground(Q, R); @Ground(P, Q)`): that table is in
# synalog_home too, never a table of that name in the customer's schema.
# Expect: rows Out = [(1,), (2,)]
V(x: 1);
V(x: 2);
V(x: 3);
@Ground(Q, R);
Q(x:) :- V(x:), x > 1;
@Ground(P, Q);
P(x:) :- V(x:), x < 3;
@OrderBy(Out, "x");
Out(x:) :- P(x:), P(x:);
