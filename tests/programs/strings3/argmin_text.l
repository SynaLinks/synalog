# The item of the least name, in code point order.
# Expect: rows Q = [(2,)]
V(id: 1, w: "b");
V(id: 2, w: "B");
V(id: 3, w: "c");
Q(id? ArgMin= id -> w) distinct :- V(id:, w:);
