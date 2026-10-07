# Test: Paths from 1 to 4 in a diamond, written out. (from tests/programs/recursion3/paths_in_a_diamond.l)

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
