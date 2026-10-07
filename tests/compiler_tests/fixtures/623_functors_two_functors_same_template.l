# Test: Two functors of one rule, joined. (from tests/programs/functors/13_two_functors_same_template.l)

Src(x: 0);
Doubled(y: 2 * x) :- Src(x:);
A(x: 1);
B(x: 10);
DA := Doubled(Src: A);
DB := Doubled(Src: B);
J(a:, b:) :- DA(y: a), DB(y: b);
