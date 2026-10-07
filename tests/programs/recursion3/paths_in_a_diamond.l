# Paths from 1 to 4 in a diamond, written out.
# Expect: rows Q = [("1-2-3-4",), ("1-2-4",), ("1-3-4",)]
E(a: 1, b: 2);
E(a: 1, b: 3);
E(a: 2, b: 3);
E(a: 2, b: 4);
E(a: 3, b: 4);
@Recursive(Path, -1);
Path(p: "1", last: 1) distinct;
Path(p: p ++ "-" ++ ToString(b), last: b) distinct :- Path(p:, last: a), E(a:, b:);
@OrderBy(Q, "p");
Q(p:) :- Path(p:, last: 4);
