# Each of the three parent links lacks its reverse.
# Expect: violated Parent.symmetric 3

@Assert(Parent, symmetric: "∀ x y, Parent x y → Parent y x");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
