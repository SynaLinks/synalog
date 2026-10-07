# Joining skips a null element.
# Expect: rows Q = [("a-b",)]
Q(s: Join(["a", null, "b"], "-"));
