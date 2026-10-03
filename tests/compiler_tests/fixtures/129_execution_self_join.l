# Test: A predicate joined with itself. (from tests/programs/execution/46_self_join.l)

Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Grand(x:, z:) :- Parent(x:, y:), Parent(x: y, y: z);
