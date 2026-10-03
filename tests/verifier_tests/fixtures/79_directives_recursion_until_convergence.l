# Verifier Test: -1 means "until convergence", which needs a loop: refused, with the reason.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/directives/20_recursion_until_convergence.l)

Next(x:, y: x + 1) :- x in Range(10);
@Recursive(Reach, -1);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
