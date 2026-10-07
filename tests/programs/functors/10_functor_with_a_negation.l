# A functor of a rule with a negation.
# Expect: rows T = [(1,)]
Src(x: 0);
Excluded(x: 2);
Kept(x:) :- Src(x:), ~Excluded(x:);
Base(x:) :- x in [1, 2];
T := Kept(Src: Base);
