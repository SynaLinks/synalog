# Test: A functor applied to a functor's result. (from tests/programs/execution/54_functor_of_a_functor.l)

All(c:) :- c in [1, 2, 3];
Odd(c:) :- c in [1, 3];
One(c:) :- c in [1];
Count(n? += 1) distinct :- All(c:);
OddCount := Count(All: Odd);
Fewer := OddCount(Odd: One);
