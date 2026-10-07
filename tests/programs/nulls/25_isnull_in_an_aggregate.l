# Counting the nulls of a column.
# Expect: rows N = [(2,)]
V(x: null);
V(x: 1);
V(x: null);
N(n? += (if IsNull(x) then 1 else 0)) distinct :- V(x:);
