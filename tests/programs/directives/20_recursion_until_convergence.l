# -1 means "until convergence", which needs a loop: refused, with the reason.
# Expect: error cannot be written as one SQL script
# Expect: compile-error Reach needs a runner that loops
Next(x:, y: x + 1) :- x in Range(10);
@Recursive(Reach, -1);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
