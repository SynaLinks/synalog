# Test: The empty string is a value, not null. (from tests/programs/strings/48_empty_string_is_not_null.l)

V(s: "");
S(n? += 1) distinct :- V(s:), s is not null;
