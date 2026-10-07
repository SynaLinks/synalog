# Test: Items blue or green. (from tests/programs/disjunction3/blue_or_green.l)

I(id: 1, c: "red", p: 10, t: null);
I(id: 2, c: "blue", p: 25, t: "x");
I(id: 3, c: "red", p: 40, t: "y");
I(id: 4, c: "green", p: 5, t: null);
I(id: 5, c: "blue", p: 60, t: "x");
I(id: 6, c: null, p: 30, t: "z");
I(id: 7, c: "green", p: 45, t: "y");
P(a: 1, b: 2);
P(a: 2, b: 3);
P(a: 4, b: 4);
P(a: 5, b: 1);
P(a: 7, b: 6);
@OrderBy(Q, "id");
Q(id:) :- I(id:, c:), (c == "blue" | c == "green");
