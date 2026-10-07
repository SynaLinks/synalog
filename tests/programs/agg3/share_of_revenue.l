# Each region's share of revenue, in percent.
# Expect: rows Q = [('east', 33.950617), ('north', 28.395062), ('south', 25.308642), ('west', 12.345679)]
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
T(total? += revenue) distinct :- R(revenue:);
@OrderBy(Q, "region", "pct");
Q(region:, pct: Round(100 * revenue / total, 6)) :- R(region:, revenue:), T(total:);
