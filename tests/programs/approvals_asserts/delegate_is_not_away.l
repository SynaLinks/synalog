# A delegate is not away.
# Expect: holds DelegatesTo.present
Away(person: "dan");
DelegatesTo(person: "dan", delegate: "fay");
@Assert(DelegatesTo, present: "∀ p d, DelegatesTo p d → ¬ Away d");
