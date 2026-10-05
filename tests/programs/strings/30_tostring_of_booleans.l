# Booleans as text are "true" and "false" on every engine.
# Expect: rows S = [("true", "false")]
S(a: ToString(true), b: ToString(false));
