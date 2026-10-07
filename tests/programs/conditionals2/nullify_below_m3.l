# Values below -3 made null, then counted.
# Expect: rows Q = [(5,)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
W(k:, y: (if x < -3 then null else x)) :- V(k:, x:);
Q(n? += (if y is null then 0 else 1)) distinct :- W(y:);
