# Test: A two-column closure computed by iteration. (from tests/programs/recursion/05_deep_closure_with_pairs.l)

Next(x:, y: x + 1) :- x in Range(4);
@Recursive(Reach, 21);
Reach(x:, y:) distinct :- Next(x:, y:);
Reach(x:, y: z) distinct :- Reach(x:, y:), Next(x: y, y: z);
N(n? += 1) distinct :- Reach();
