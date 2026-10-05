# A chain of concatenations.
# Expect: rows Q = [('<x|X|1>',)]
Q(s: "<" ++ w ++ "|" ++ Upper(w) ++ "|" ++ ToString(Length(w)) ++ ">") :- w == "x";
