# Near has two columns, applied to three.
# Expect: error Invalid assertion 'Near.arity'

@Assert(Near, arity: "∀ x y z, Near x y z → Near x y");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
Near(x:, y:) :- Parent(x:, y:);
Near(x:, y: z) :- Parent(x:, y:), Parent(x: y, y: z);
