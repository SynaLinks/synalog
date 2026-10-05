# No author influences themselves directly.
# Expect: holds Influenced.irreflexive
Influenced(a: "austen", b: "tolkien");
Influenced(a: "tolkien", b: "herbert");
Influenced(a: "herbert", b: "gibson");
Influenced(a: "asimov", b: "herbert");
@Assert(Influenced, irreflexive: "∀ a, ¬ Influenced a a");
