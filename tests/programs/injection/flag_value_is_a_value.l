# FlagValue gives the flag's text as a value.
# Expect: rows Q = [("a'; DROP TABLE t; --",)]
@DefineFlag("x", "a'; DROP TABLE t; --");
Q(s: FlagValue("x"));
