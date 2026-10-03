# A two-column closure computed by iteration.
# Expect: rows N = [(10,)]
Next(x:, y: x + 1) :- x in Range(4);
@Recursive(Reach, 30);
Reach(x:, y:) distinct :- Next(x:, y:);
Reach(x:, y: z) distinct :- Reach(x:, y:), Next(x: y, y: z);
N(n? += 1) distinct :- Reach();
