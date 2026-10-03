# Every ancestor has a child.
# Expect: holds Ancestor.grounded

@Assert(Ancestor, grounded: "∀ x y, Ancestor x y → ∃ w, Parent x w");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
