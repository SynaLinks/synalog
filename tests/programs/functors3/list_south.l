# A list collected by a generic from a substitute.
# Expect: rows Q = [(3, 305)]
Sale(id: 1, region: "north", product: "tea", amount: 120);
Sale(id: 2, region: "north", product: "cake", amount: 40);
Sale(id: 3, region: "south", product: "tea", amount: 75);
Sale(id: 4, region: "south", product: "coffee", amount: 210);
Sale(id: 5, region: "east", product: "cake", amount: 55);
Sale(id: 6, region: "east", product: "tea", amount: 130);
Sale(id: 7, region: "north", product: "coffee", amount: 95);
Sale(id: 8, region: "south", product: "cake", amount: 20);
X(id: 0, amount: 0);
Collect(l? List= amount) distinct :- X(amount:);
F(id:, amount:) :- Sale(id:, region: "south", amount:);
R := Collect(X: F);
T(t? += x) distinct :- R(l:), x in l;
Q(n: Size(l), t:) :- R(l:), T(t:);
