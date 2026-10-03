# A cycle a→b→a makes a and b their own ancestors.
# Expect: violated Ancestor.irreflexive 2

@Assert(Ancestor, irreflexive: "∀ x, ¬ Ancestor x x");
Parent(x: "a", y: "b");
Parent(x: "b", y: "a");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
