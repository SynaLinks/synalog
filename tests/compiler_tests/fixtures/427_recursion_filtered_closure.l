# Test: A closure that follows only some edges. (from tests/programs/recursion/27_filtered_closure.l)

E(a: 1, b: 2, ok: true);
E(a: 2, b: 3, ok: false);
@Recursive(Reach, 5);
@OrderBy(Reach, "x");
Reach(x: 1) distinct;
Reach(x: b) distinct :- Reach(x: a), E(a:, b:, ok: true);
