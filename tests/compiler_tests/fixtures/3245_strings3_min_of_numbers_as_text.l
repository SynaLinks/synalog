# Test: Numbers as text compare as text: "10" < "9". (from tests/programs/strings3/min_of_numbers_as_text.l)

V(w: "9");
V(w: "10");
Q(lo? Min= w, hi? Max= w) distinct :- V(w:);
