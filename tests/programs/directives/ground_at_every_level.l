# Grounded at four levels, each built on the one before and read twice
# (a join of the level with itself): each is stored in synalog_home, before
# the level that reads it, and read from there.
# Expect: rows Pairs = [("north", "south", 270, 330)]
Sale(region: "north", amount: 100);
Sale(region: "north", amount: 170);
Sale(region: "south", amount: 150);
Sale(region: "south", amount: 180);
Sale(region: "west", amount: -5);
Sale(region: "west", amount: 40);
@Ground(Clean);
Clean(region:, amount:) :- Sale(region:, amount:), amount > 0;
@Ground(Totals);
Totals(region:, total? += amount) distinct :- Clean(region:, amount:);
@Ground(Large);
Large(region:, total:) :- Totals(region:, total:), total > 200;
@Ground(Pairs);
@OrderBy(Pairs, "a");
Pairs(a:, b:, ta:, tb:) :- Large(region: a, total: ta), Large(region: b, total: tb), a < b;
