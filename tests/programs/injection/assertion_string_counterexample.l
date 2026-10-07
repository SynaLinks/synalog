# A value with a quote as a counterexample.
# Expect: counterexamples V.plain = [("a'; DROP TABLE t; --",)]
V(s: "plain");
V(s: "a'; DROP TABLE t; --");
@Assert(V, plain: """∀ s, V s → s = "plain" """);
