# The 2 cheapest sales of each shop, kept by ArgMinK.
# Expect: rows Q = [('lima', 6), ('lima', 7), ('oslo', 1), ('oslo', 8), ('rome', 3), ('rome', 4)]
S(id: 1, shop: "oslo", day: "2026-01-03", product: "tea", qty: 2, price: 3.5);
S(id: 2, shop: "oslo", day: "2026-01-17", product: "cake", qty: null, price: 4.0);
S(id: 3, shop: "rome", day: "2026-02-02", product: "tea", qty: 5, price: 3.0);
S(id: 4, shop: "rome", day: "2026-02-11", product: "coffee", qty: 1, price: 2.5);
S(id: 5, shop: "rome", day: "2026-03-09", product: "cake", qty: 3, price: 4.5);
S(id: 6, shop: "lima", day: "2026-03-21", product: "coffee", qty: 4, price: 2.0);
S(id: 7, shop: "lima", day: "2026-01-30", product: "tea", qty: null, price: 3.25);
S(id: 8, shop: "oslo", day: "2026-03-02", product: "coffee", qty: 6, price: 2.75);
S(id: 9, shop: "lima", day: "2026-02-14", product: "cake", qty: 2, price: 5.0);
Low(x) = ArgMinK(x, 2);
T(shop:, l? Low= id -> price) distinct :- S(shop:, id:, price:);
@OrderBy(Q, "shop", "id");
Q(shop:, id:) :- T(shop:, l:), id in l;
