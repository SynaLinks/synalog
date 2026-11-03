# `x is y` compares two values as values: a null is a null, and differs from
# any other value. `==` keeps SQL's meaning: a null equals nothing.
# Expect: rows Same = [(1, 1), (None, None)]
# Expect: rows Equal = [(1, 1)]
# Expect: rows Differ = [(1, None), (None, 1)]
@OrderBy(Same, "x"); @OrderBy(Equal, "x"); @OrderBy(Differ, "x");
V(x: 1);
V(x: null);
Same(x:, y:) :- V(x:), V(x: y), x is y;
Equal(x:, y:) :- V(x:), V(x: y), x == y;
Differ(x:, y:) :- V(x:), V(x: y), x is not y;
