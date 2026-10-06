# Part 1 of 'a,b,c' split at commas.
# Expect: rows Q = [('b',)]
Q(e: Element(Split("a,b,c", ","), 1));
