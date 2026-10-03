# not, /\, !=, <= in ASCII.
# Expect: holds Ancestor.distinct_ends

@Assert(Ancestor, distinct_ends: "forall x y, Ancestor x y -> not (x = y) /\ x != y");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
