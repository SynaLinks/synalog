# The SQL is the same with or without the assertion.
# Expect: same-sql Ancestor

@Assert(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
