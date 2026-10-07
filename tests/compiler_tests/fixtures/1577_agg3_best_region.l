# Test: The region with the most revenue: an aggregate of an aggregate. (from tests/programs/agg3/best_region.l)

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
R(region:, revenue? += qty * price) distinct :- Sale(region:, qty:, price:);
Q(region? ArgMax= region -> revenue) distinct :- R(region:, revenue:);
