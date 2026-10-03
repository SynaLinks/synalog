# The total is 6, not 7.
# Expect: violated Total.value 1
@Assert(Total, value: "Total = 7");
V(x:) :- x in [1, 2, 3];
Total(t? += x) distinct :- V(x:);
