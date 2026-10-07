# Test: Upper case letters all come before lower case ones. (from tests/programs/strings3/text_between_cases.l)

V(w: "Z");
V(w: "a");
Q(w:) :- V(w:), w < "a";
