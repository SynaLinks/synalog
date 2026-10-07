# A string holding an apostrophe in the statement.
# Expect: holds S.value
@Assert(S, value: """∀ k, S k = "it's" """);
S(k: 1, s: "it's");
