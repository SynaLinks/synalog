# Texts built in the branches.
# Expect: rows Q = [(1, '+5'), (2, '-3'), (3, '0'), (4, None), (5, '+12'), (6, '+7')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x > 0 then "+" ++ ToString(x) else ToString(x))) :- V(k:, x:, s:);
