# Counting rows counts those holding nulls.
# Expect: rows N = [(3,)]
V(x: 1);
V(x: null);
V(x: 2);
N(n? += 1) distinct :- V(x:);
