# ArgMin picks the argument of the smallest value.
# Expect: rows Cheapest = [("pen",)]
Price(item: "pen", p: 1);
Price(item: "book", p: 9);
Cheapest(item? ArgMin= item -> p) distinct :- Price(item:, p:);
