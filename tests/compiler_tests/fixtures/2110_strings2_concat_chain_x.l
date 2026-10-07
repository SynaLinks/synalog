# Test: A chain of concatenations. (from tests/programs/strings2/concat_chain_x.l)

Q(s: "<" ++ w ++ "|" ++ Upper(w) ++ "|" ++ ToString(Length(w)) ++ ">") :- w == "x";
