# A function returning text from a number.
# Expect: rows S = [(1, "1st"), (2, "2nd"), (4, "4th")]
Ordinal(n) = ToString(n) ++ (if n == 1 then "st" else if n == 2 then "nd" else "th");
V(n:) :- n in [1, 2, 4];
@OrderBy(S, "n");
S(n:, o: Ordinal(n)) :- V(n:);
