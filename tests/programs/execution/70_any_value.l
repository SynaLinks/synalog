# 1= picks the single value of a group.
# Expect: rows One = [("a", 7)]
R(k: "a", v: 7);
R(k: "a", v: 7);
One(k:, v? 1= v) distinct :- R(k:, v:);
