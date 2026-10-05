# ArgMax returning a number.
# Expect: rows A = [(30,)]
V(id: 10, s: 1);
V(id: 30, s: 9);
V(id: 20, s: 5);
A(w? ArgMax= id -> s) distinct :- V(id:, s:);
