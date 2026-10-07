# Test: Text columns as integers, summed. (from tests/programs/casts/17_toint_of_a_column_of_text.l)

V(s:) :- s in ["5", "10"];
C(t? += ToInt64(s)) distinct :- V(s:);
