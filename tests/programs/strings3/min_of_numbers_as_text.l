# Numbers as text compare as text: "10" < "9".
# Expect: rows Q = [("10", "9")]
V(w: "9");
V(w: "10");
Q(lo? Min= w, hi? Max= w) distinct :- V(w:);
