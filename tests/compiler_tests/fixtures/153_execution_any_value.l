# Test: 1= picks the single value of a group. (from tests/programs/execution/70_any_value.l)

R(k: "a", v: 7);
R(k: "a", v: 7);
One(k:, v? 1= v) distinct :- R(k:, v:);
