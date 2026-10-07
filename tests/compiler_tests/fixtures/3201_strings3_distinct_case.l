# Test: Distinct keeps both cases. (from tests/programs/strings3/distinct_case.l)

V(w: "a");
V(w: "A");
V(w: "a");
D(w:) distinct :- V(w:);
Q(n? += 1) distinct :- D(w:);
