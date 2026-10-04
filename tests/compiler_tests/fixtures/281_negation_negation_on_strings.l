# Test: Negation matching strings. (from tests/programs/negation/06_negation_on_strings.l)

V(s:) :- s in ["a", "b"];
Seen(s: "a");
Out(s:) :- V(s:), ~Seen(s:);
