# How many cake sales, by a generic count.
# Expect: rows R = [(3,)]
Sale(id: 1, region: "north", product: "tea", amount: 120);
Sale(id: 2, region: "north", product: "cake", amount: 40);
Sale(id: 3, region: "south", product: "tea", amount: 75);
Sale(id: 4, region: "south", product: "coffee", amount: 210);
Sale(id: 5, region: "east", product: "cake", amount: 55);
Sale(id: 6, region: "east", product: "tea", amount: 130);
Sale(id: 7, region: "north", product: "coffee", amount: 95);
Sale(id: 8, region: "south", product: "cake", amount: 20);
Src(id: 0, amount: 0);
A(id: 0);
B(id: 0);
Total(t? += amount) distinct :- Src(amount:);
CountOf(n? += 1) distinct :- Src(id:);
Mean(m? Avg= amount) distinct :- Src(amount:);
Top(best? ArgMax= id -> amount) distinct :- Src(id:, amount:);
Both(id:) :- A(id:), B(id:);
Missing(id:) :- A(id:), ~B(id:);
F(id:, amount:) :- Sale(id:, product: "cake", amount:);
R := CountOf(Src: F);
