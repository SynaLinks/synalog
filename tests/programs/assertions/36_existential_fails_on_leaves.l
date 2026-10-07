# d has no child.
# Expect: violated Person.has_child 1
# Expect: counterexamples Person.has_child = [("d",)]

@Assert(Person, has_child: "∀ p, Person p → ∃ c, Parent p c");
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
Person(name:) distinct :- Parent(x: name) | Parent(y: name);
