# Min over strings.
# Expect: rows A = [("apple",)]
V(s:) :- s in ["pear", "apple", "fig"];
A(m? Min= s) distinct :- V(s:);
