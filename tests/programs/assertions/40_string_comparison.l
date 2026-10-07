# ISO dates compare as strings: a period starts before it ends.
# Expect: violated MemberOf.period 1
# Expect: counterexamples MemberOf.period = [(2, "2026-05-01", "2026-02-01")]

@Assert(MemberOf, period: "∀ p f u, MemberOf p f u → f < u");
MemberOf(person_id: 1, valid_from: "2026-01-01", valid_to: "2026-03-01");
MemberOf(person_id: 2, valid_from: "2026-05-01", valid_to: "2026-02-01");
