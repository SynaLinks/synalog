# Verifier Test: A statement without a name.
# Expected Error: AssertionError.malformedAssertion
#
# (from tests/programs/assertions/32_unnamed_statement.l)

@Assert(Ancestor, "∀ x, ¬ Ancestor x x");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
