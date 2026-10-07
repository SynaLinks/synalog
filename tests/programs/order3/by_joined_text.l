# Ordered by s and k joined as text, then k; nulls last.
# Expect: rows Q = [(5, 'B-5'), (2, 'a-2'), (6, 'a-6'), (8, 'aa-8'), (1, 'b-1'), (4, 'c-4'), (3, None), (7, None)]
R(k: 1, x: 5, s: "b", b: true);
R(k: 2, x: null, s: "a", b: false);
R(k: 3, x: 2, s: null, b: true);
R(k: 4, x: 5, s: "c", b: null);
R(k: 5, x: -1, s: "B", b: false);
R(k: 6, x: 2, s: "a", b: true);
R(k: 7, x: null, s: null, b: false);
R(k: 8, x: 9, s: "aa", b: true);
@OrderBy(Q, "t", "k");
Q(k:, t: s ++ "-" ++ ToString(k)) :- R(k:, s:);
