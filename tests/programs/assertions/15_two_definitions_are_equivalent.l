# A closure written forwards and backwards: the same relation.
# Expect: holds Ancestor.same

@Assert(Ancestor, same: "∀ x y, Ancestor x y ↔ Reaches x y");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
@Recursive(Reaches, 20);
Reaches(x:, y:) :- Parent(x:, y:);
Reaches(x:, y:) :- Parent(x:, y: m), Reaches(x: m, y:);
