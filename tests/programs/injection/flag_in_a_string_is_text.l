# `${...}` in a string is text, whatever flags the program defines.
# Expect: rows Q = [("costs ${x}",)]
@DefineFlag("x", "a'; SELECT 99 AS s; --");
Q(s: "costs ${x}");
