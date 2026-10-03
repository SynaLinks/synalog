# Verifier Test: Near has two columns, applied to three.
# Expected Error: AssertionError.invalidAssertion
#
# (from tests/programs/assertions/30_wrong_arity.l)

@Assert(Near, arity: "∀ x y z, Near x y z → Near x y");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
Near(x:, y:) :- Parent(x:, y:);
Near(x:, y: z) :- Parent(x:, y:), Parent(x: y, y: z);
