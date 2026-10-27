# Null keys of numbers, strings, booleans, lists and records join null keys,
# and no value of their type (0, "", false, [], a record of nulls).
# Expect: rows Q = [('bool', 'null'), ('list', 'null'), ('number', 'null'), ('record', 'null'), ('string', 'null')]
N(k: 0, v: "0");
N(k: null, v: "null");
S(k: "", v: "empty");
S(k: null, v: "null");
B(k: false, v: "false");
B(k: null, v: "null");
L(k: [], v: "[]");
L(k: null, v: "null");
R(k: {a: null}, v: "{a: null}");
R(k: null, v: "null");
@OrderBy(Q, "t");
Q(t: "number", v:) :- N(k:, v:), N(k:, v: "null");
Q(t: "string", v:) :- S(k:, v:), S(k:, v: "null");
Q(t: "bool", v:) :- B(k:, v:), B(k:, v: "null");
Q(t: "list", v:) :- L(k:, v:), L(k:, v: "null");
Q(t: "record", v:) :- R(k:, v:), R(k:, v: "null");
