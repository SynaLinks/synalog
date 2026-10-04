# Test: -1 recurses until nothing changes: synalog runs it to its fixpoint, while compile() refuses it, since a script cannot stop by itself. (from tests/programs/directives/20_recursion_until_convergence.l)
Next(x:, y: x + 1) :- x in Range(10);
@Recursive(Reach, -1);
@OrderBy(Reach, "y");
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
