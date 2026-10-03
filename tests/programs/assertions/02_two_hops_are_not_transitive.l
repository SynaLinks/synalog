# Two hops only: a→b→d and a→c→d have no a→d.
# Expect: violated Near.transitive 2

@Assert(Near, transitive: "∀ x y z, Near x y → Near y z → Near x z");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
Near(x:, y:) :- Parent(x:, y:);
Near(x:, y: z) :- Parent(x:, y:), Parent(x: y, y: z);
