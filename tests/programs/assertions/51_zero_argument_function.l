# A one-column predicate applied to nothing is its value.
# Expect: holds Total.value
@Assert(Total, value: "Total = 6");
V(x:) :- x in [1, 2, 3];
Total(t? += x) distinct :- V(x:);
