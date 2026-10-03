# Assertions read a deep recursive predicate like any other.
# Expect: counterexamples Reach.small = [(26,), (27,), (28,), (29,), (30,)]
@Assert(Reach, small: "∀ y, Reach y → y ≤ 25");
Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 30);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
