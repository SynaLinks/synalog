# Test: Distinct words of a sentence, counted. (from tests/programs/strings/47_join_of_a_set_size.l)

W(w:) :- w in Split("a b a", " ");
C(s? Set= w) distinct :- W(w:);
S(n: Size(s)) :- C(s:);
