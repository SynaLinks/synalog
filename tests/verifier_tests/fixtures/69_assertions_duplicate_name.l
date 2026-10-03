# Verifier Test: The same name twice for a predicate.
# Expected Error: AssertionError.duplicateAssertion
#
# (from tests/programs/assertions/31_duplicate_name.l)

@Assert(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");
@Assert(Ancestor, transitive: "∀ x, ¬ Ancestor x x");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
