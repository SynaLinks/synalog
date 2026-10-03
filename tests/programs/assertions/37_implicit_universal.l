# Unbound lowercase names are universally quantified.
# Expect: holds Ancestor.transitive

@Assert(Ancestor, transitive: "Ancestor x y → Ancestor y z → Ancestor x z");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
