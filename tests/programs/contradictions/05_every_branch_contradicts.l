# A disjunction both of whose branches contradict the rule's other condition.
# Expect: warning Contradictory conditions:
# Expect: rows C = []
V(x:) :- x in [1, 3, 7];
C(x:) :- V(x:), (x < 0 | x > 5), x == 3;
