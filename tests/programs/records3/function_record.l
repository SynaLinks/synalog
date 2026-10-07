# A function giving a record.
# Expect: rows Q = [(3, 9, 27)]
Powers(x) = {x:, sq: x * x, cube: x * x * x};
Q(x: p.x, sq: p.sq, cube: p.cube) :- p == Powers(3);
