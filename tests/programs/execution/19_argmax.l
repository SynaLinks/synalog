# ArgMax picks the argument of the largest value.
# Expect: rows Best = [("b",)]
Score(name: "a", s: 1);
Score(name: "b", s: 5);
Score(name: "c", s: 3);
Best(name? ArgMax= name -> s) distinct :- Score(name:, s:);
