# Filtering groups by their aggregate.
# Expect: rows Big = [("a",)]
R(k: "a", v: 10);
R(k: "a", v: 20);
R(k: "b", v: 5);
T(k:, t? += v) distinct :- R(k:, v:);
@OrderBy(Big, "k");
Big(k:) :- T(k:, t:), t > 10;
