# Test: ArgMin picks the argument of the smallest value. (from tests/programs/execution/49_argmin.l)

Price(item: "pen", p: 1);
Price(item: "book", p: 9);
Cheapest(item? ArgMin= item -> p) distinct :- Price(item:, p:);
