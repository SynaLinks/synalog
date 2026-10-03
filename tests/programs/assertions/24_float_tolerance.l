# A third times three is one, up to 1e-9.
# Expect: holds Third.definition

@Assert(Third, definition: "∀ x, Third x * 3 = 1");
Third(x: 1, value: 1.0 / 3.0);
