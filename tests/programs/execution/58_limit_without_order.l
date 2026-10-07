# @Limit alone still caps the count.
# Expect: rows N = [(2,)]
V(x:) :- x in [1, 2, 3];
@Limit(Two, 2);
Two(x:) :- V(x:);
N(n? += 1) distinct :- Two(x:);
