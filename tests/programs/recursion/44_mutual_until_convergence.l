# Mutual recursion until it converges: synalog runs it to its fixpoint, while
# compile() refuses it, since one query does not hold mutual recursion and a
# script cannot stop by itself.
# Expect: compile-error Even more steps than a SQL script can hold
# Expect: rows Even = [(0,), (2,), (4,)]
@Recursive(Even, -1);
@Recursive(Odd, -1);
@OrderBy(Even, "x");
Even(x: 0) distinct;
Even(x: y + 1) distinct :- Odd(x: y), y < 4;
Odd(x: y + 1) distinct :- Even(x: y), y < 4;
