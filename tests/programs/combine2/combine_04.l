# combine += 1.
# Expect: rows T = [(4,)]
V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
T(t:) :- t == (combine += 1 :- V(s:), s % 2 == 1);
