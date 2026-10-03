# Two @Assert for one predicate, different names.
# Expect: holds Ancestor.transitive
# Expect: holds Ancestor.irreflexive

@Assert(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");
@Assert(Ancestor, irreflexive: "∀ x, ¬ Ancestor x x");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
