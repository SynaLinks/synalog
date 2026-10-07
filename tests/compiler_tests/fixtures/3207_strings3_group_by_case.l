# Test: Grouping tells cases apart. (from tests/programs/strings3/group_by_case.l)

V(k: 1, w: "a");
V(k: 2, w: "A");
V(k: 3, w: "a");
@OrderBy(Q, "w");
Q(w:, n? += 1) distinct :- V(w:);
