# @Dataset is no directive: a program's tables are in synalog_home only.
# Expect: error special predicates are allowed
@Dataset("analytics");
@Ground(V);
V(x: 1);
Q(x:) :- V(x:);
