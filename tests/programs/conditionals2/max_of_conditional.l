# The largest conditional value.
# Expect: rows Q = [(24,)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
Q(m? Max= (if x > 0 then x * 2 else x - 1)) distinct :- V(x:);
