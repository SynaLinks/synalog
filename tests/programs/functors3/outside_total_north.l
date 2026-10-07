# The total of the sales outside north: a placeholder negated in an aggregate.
# Expect: rows R = [(490,)]
Sale(id: 1, region: "north", product: "tea", amount: 120);
Sale(id: 2, region: "north", product: "cake", amount: 40);
Sale(id: 3, region: "south", product: "tea", amount: 75);
Sale(id: 4, region: "south", product: "coffee", amount: 210);
Sale(id: 5, region: "east", product: "cake", amount: 55);
Sale(id: 6, region: "east", product: "tea", amount: 130);
Sale(id: 7, region: "north", product: "coffee", amount: 95);
Sale(id: 8, region: "south", product: "cake", amount: 20);
X(id: 0);
Outside(t? += amount) distinct :- Sale(id:, amount:), ~X(id:);
F(id:) :- Sale(id:, region: "north", amount:);
R := Outside(X: F);
