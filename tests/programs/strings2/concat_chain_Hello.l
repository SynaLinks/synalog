# A chain of concatenations.
# Expect: rows Q = [('<Hello|HELLO|5>',)]
Q(s: "<" ++ w ++ "|" ++ Upper(w) ++ "|" ++ ToString(Length(w)) ++ ">") :- w == "Hello";
