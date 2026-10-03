# A predicate joined with itself.
# Expect: rows Grand = [("a", "c")]
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Grand(x:, z:) :- Parent(x:, y:), Parent(x: y, y: z);
