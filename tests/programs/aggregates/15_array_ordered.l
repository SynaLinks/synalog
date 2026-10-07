# Array= collects values ordered by a key.
# Expect: rows A = [(["a", "b", "c"],)]
V(k: 3, v: "c");
V(k: 1, v: "a");
V(k: 2, v: "b");
A(l? Array= k -> v) distinct :- V(k:, v:);
