# Joining with a non-ASCII separator.
# Expect: rows Q = [("a→b→c",)]
Q(s: Join(["a", "b", "c"], "→"));
