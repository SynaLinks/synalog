# Test: FlagValue gives the flag's text as a value. (from tests/programs/injection/flag_value_is_a_value.l)

@DefineFlag("x", "a'; DROP TABLE t; --");
Q(s: FlagValue("x"));
