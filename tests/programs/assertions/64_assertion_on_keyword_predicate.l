# An assertion about predicates named after SQL keywords.
# Expect: counterexamples Select.grouped = [(2,)]
@Assert(Select, grouped: "∀ g, Select g → ∃ v, Group g v");
Group(g: 1, v: 10);
Select(g:) :- g in [1, 2];
