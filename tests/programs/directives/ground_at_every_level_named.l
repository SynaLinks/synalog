# Grounded at four levels, each in a table named otherwise, one of them as
# the customer's table (`Sale`): every one is in synalog_home, the
# customer's table is only read.
# Expect: rows Out = [("north", "south", 270, 330)]
Sale(region: "north", amount: 100);
Sale(region: "north", amount: 170);
Sale(region: "south", amount: 150);
Sale(region: "south", amount: 180);
Sale(region: "west", amount: -5);
Sale(region: "west", amount: 40);
@Ground(Clean, Sale);
Clean(region:, amount:) :- Sale(region:, amount:), amount > 0;
@Ground(Totals, Users);
Totals(region:, total? += amount) distinct :- Clean(region:, amount:);
@Ground(Large, Orders);
Large(region:, total:) :- Totals(region:, total:), total > 200;
@Ground(Pairs, Stored);
Pairs(a:, b:, ta:, tb:) :- Large(region: a, total: ta), Large(region: b, total: tb), a < b;
@OrderBy(Out, "a");
Out(a:, b:, ta:, tb:) :- Pairs(a:, b:, ta:, tb:);
