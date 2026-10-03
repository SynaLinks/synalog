# An assertion about a predicate computed by iteration (past 20 steps).
# Expect: holds Reach.reaches_far
@Assert(Reach, reaches_far: "∃ y, Reach y ∧ y = 30");
Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 30);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
