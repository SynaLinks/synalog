# Direct links are ancestors, but not every ancestor is a direct link: a→c, b→d, a→d.
# Expect: violated Ancestor.direct 3

@Assert(Ancestor, direct: "∀ x y, Ancestor x y ↔ Parent x y");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
