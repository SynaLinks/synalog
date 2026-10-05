# Distinct words of a sentence, counted.
# Expect: rows S = [(2,)]
W(w:) :- w in Split("a b a", " ");
C(s? Set= w) distinct :- W(w:);
S(n: Size(s)) :- C(s:);
