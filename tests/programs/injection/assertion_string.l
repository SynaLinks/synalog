# A string with a quote in an assertion.
# Expect: holds V.not_payload
V(s: "plain");
@Assert(V, not_payload: """∀ s, V s → s ≠ "x' OR '1'='1" """);
