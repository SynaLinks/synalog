# Ordered by b desc, then k desc; nulls last unless asked first.
# Expect: rows Q = [(8, 9, 'aa', True), (6, 2, 'a', True), (3, 2, None, True), (1, 5, 'b', True), (7, None, None, False), (5, -1, 'B', False), (2, None, 'a', False), (4, 5, 'c', None)]
R(k: 1, x: 5, s: "b", b: true);
R(k: 2, x: null, s: "a", b: false);
R(k: 3, x: 2, s: null, b: true);
R(k: 4, x: 5, s: "c", b: null);
R(k: 5, x: -1, s: "B", b: false);
R(k: 6, x: 2, s: "a", b: true);
R(k: 7, x: null, s: null, b: false);
R(k: 8, x: 9, s: "aa", b: true);
@OrderBy(Q, "b desc", "k desc");
Q(k:, x:, s:, b:) :- R(k:, x:, s:, b:);
