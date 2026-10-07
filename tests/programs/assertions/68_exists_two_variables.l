# ∃ over two variables at once.
# Expect: counterexamples Person.has_edge = [("z",)]
@Assert(Person, has_edge: "∀ p, Person p → ∃ a b, Edge a b ∧ (a = p ∨ b = p)");
Person(name:) :- name in ["x", "y", "z"];
Edge(a: "x", b: "y");
