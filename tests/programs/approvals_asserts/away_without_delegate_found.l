# Someone away with no delegate.
# Expect: violated Away.delegated 1
# Expect: counterexamples Away.delegated = [("cal",)]
Away(person: "dan");
Away(person: "cal");
DelegatesTo(person: "dan", delegate: "fay");
@Assert(Away, delegated: "∀ p, Away p → ∃ d, DelegatesTo p d");
