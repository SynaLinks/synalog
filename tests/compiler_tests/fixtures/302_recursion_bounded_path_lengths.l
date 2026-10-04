# Test: Path lengths, bounded in the rule itself. (from tests/programs/recursion/20_bounded_path_lengths.l)

Edge(a: 1, b: 2);
Edge(a: 2, b: 3);
Edge(a: 3, b: 4);
Edge(a: 4, b: 5);
@Recursive(Path, 30);
Path(a:, b:, n: 1) distinct :- Edge(a:, b:);
Path(a:, b: c, n: n + 1) distinct :- Path(a:, b:, n:), Edge(a: b, b: c), n < 3;
@OrderBy(Len, "n");
Len(n:) distinct :- Path(n:);
