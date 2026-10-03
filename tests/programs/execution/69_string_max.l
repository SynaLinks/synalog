# Max over strings.
# Expect: rows Last = [("pear",)]
F(n:) :- n in ["apple", "pear", "fig"];
Last(n? Max= n) distinct :- F(n:);
