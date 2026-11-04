# `is` matches a null with a null, of numbers, strings, booleans, lists and
# records, and with no value of their type (0, "", false, [], a record of
# nulls); a value matches itself.
# Expect: rows Q = [('bool', 'false', 'false'), ('bool', 'null', 'null'), ('list', '[]', '[]'), ('list', 'null', 'null'), ('number', '0', '0'), ('number', 'null', 'null'), ('record', 'null', 'null'), ('record', '{a: null}', '{a: null}'), ('string', 'empty', 'empty'), ('string', 'null', 'null')]
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
@OrderBy(Q, "t", "v");
Q(t: "number", v:, w:) :- N(k:, v:), N(k: j, v: w), k is j;
Q(t: "string", v:, w:) :- S(k:, v:), S(k: j, v: w), k is j;
Q(t: "bool", v:, w:) :- B(k:, v:), B(k: j, v: w), k is j;
Q(t: "list", v:, w:) :- L(k:, v:), L(k: j, v: w), k is j;
Q(t: "record", v:, w:) :- R(k:, v:), R(k: j, v: w), k is j;
