# Test: A closure joining the recursion with itself recomputes every step (not semi-naive), and finds the same pairs. (from tests/programs/recursion/16_nonlinear_closure.l)

Next(x:, y: x + 1) :- x in Range(9);
@Recursive(Path, 25);
Path(a: x, b: y) distinct :- Next(x:, y:);
Path(a:, b: c) distinct :- Path(a:, b:), Path(a: b, b: c);
N(n? += 1) distinct :- Path();
