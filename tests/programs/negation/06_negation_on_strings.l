# Negation matching strings.
# Expect: rows Out = [("b",)]
V(s:) :- s in ["a", "b"];
Seen(s: "a");
Out(s:) :- V(s:), ~Seen(s:);
