# A chain of concatenations.
# Expect: rows Q = [('<abc|ABC|3>',)]
Q(s: "<" ++ w ++ "|" ++ Upper(w) ++ "|" ++ ToString(Length(w)) ++ ">") :- w == "abc";
