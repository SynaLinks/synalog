# A page of 10 sales from 0.
# Expect: page Q 10 0 = [(1,), (2,), (3,), (4,), (5,), (6,), (7,), (8,), (9,), (10,)]
Sale(id: 1, region: "north", item: "tea", qty: 4, price: 30);
Sale(id: 2, region: "north", item: "coffee", qty: 2, price: 50);
Sale(id: 3, region: "south", item: "tea", qty: 6, price: 30);
Sale(id: 4, region: "south", item: "cake", qty: 1, price: 80);
Sale(id: 5, region: "east", item: "coffee", qty: 5, price: 50);
Sale(id: 6, region: "east", item: "tea", qty: 2, price: 30);
Sale(id: 7, region: "north", item: "cake", qty: 3, price: 80);
Sale(id: 8, region: "west", item: "coffee", qty: 4, price: 50);
Sale(id: 9, region: "south", item: "coffee", qty: 3, price: 50);
Sale(id: 10, region: "east", item: "cake", qty: 3, price: 80);
@OrderBy(Q, "id");
Q(id:) :- Sale(id:);
