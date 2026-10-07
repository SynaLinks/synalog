# Test: `${...}` in a string is text, whatever flags the program defines. (from tests/programs/injection/flag_in_a_string_is_text.l)

@DefineFlag("x", "a'; SELECT 99 AS s; --");
Q(s: "costs ${x}");
