# Test: eve's orders counted over a union. (from tests/programs/pipelines/orders_of_eve_from_two_rules.l)

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
Any(id:, who:) distinct :- Order(id:, who:, state: "paid") | Order(id:, who:, state:), state != "paid";
Q(n? += 1) distinct :- Any(who: "eve");
