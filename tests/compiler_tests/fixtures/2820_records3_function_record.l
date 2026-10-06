# Test: A function giving a record. (from tests/programs/records3/function_record.l)

Powers(x) = {x:, sq: x * x, cube: x * x * x};
Q(x: p.x, sq: p.sq, cube: p.cube) :- p == Powers(3);
