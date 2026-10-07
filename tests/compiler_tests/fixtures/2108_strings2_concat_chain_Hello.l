# Test: A chain of concatenations. (from tests/programs/strings2/concat_chain_Hello.l)

Q(s: "<" ++ w ++ "|" ++ Upper(w) ++ "|" ++ ToString(Length(w)) ++ ">") :- w == "Hello";
