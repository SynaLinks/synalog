# @Ground of an undefined predicate.
# Expect: error @Ground(Nope) is about 'Nope', which the program does not define
@Ground(Nope);
V(x:) :- x in [1, 2];
