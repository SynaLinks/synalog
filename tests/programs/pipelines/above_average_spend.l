# Spenders above the average, Spend read twice.
# Expect: rows Q = [('cy',), ('eve',)]
Order(id: 1, who: "ann", item: "tea", n: 3, state: "paid");
Order(id: 2, who: "bob", item: "cake", n: 1, state: "paid");
Order(id: 3, who: "ann", item: "cake", n: 2, state: "refunded");
Order(id: 4, who: "cy", item: "tea", n: 5, state: "paid");
Order(id: 5, who: "dee", item: "coffee", n: 2, state: "pending");
Order(id: 6, who: "bob", item: "tea", n: 1, state: "paid");
Order(id: 7, who: "cy", item: "coffee", n: 4, state: "paid");
Order(id: 8, who: "ann", item: "coffee", n: 1, state: "pending");
Order(id: 9, who: "eve", item: "cake", n: 6, state: "paid");
Order(id: 10, who: "eve", item: "tea", n: 2, state: "refunded");
Price(item: "tea", p: 4);
Price(item: "cake", p: 9);
Price(item: "coffee", p: 6);
@Ground(Spend);
Paid(id:, who:, item:, n:) :- Order(id:, who:, item:, n:, state: "paid");
Line(id:, who:, amount: n * p) :- Paid(id:, who:, item:, n:), Price(item:, p:);
Spend(who:, total? += amount) distinct :- Line(who:, amount:);
A(a? Avg= total) distinct :- Spend(total:);
@OrderBy(Q, "who");
Q(who:) :- Spend(who:, total:), A(a:), total > a;
