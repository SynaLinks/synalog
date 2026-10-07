# Test: Membership of text in a list tells cases apart. (from tests/programs/strings3/in_list_of_text.l)

V(w: "b");
V(w: "B");
Q(w:) :- V(w:), w in ["a", "b"];
