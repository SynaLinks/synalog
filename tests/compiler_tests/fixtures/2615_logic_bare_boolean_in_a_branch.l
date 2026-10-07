# Test: A boolean variable as one branch of a disjunction. (from tests/programs/logic/bare_boolean_in_a_branch.l)

V(x: 1, b: true, s: "ab");
V(x: 2, b: false, s: "ba");
V(x: 3, b: null, s: null);
@OrderBy(Q, "x");
Q(x:) distinct :- V(x:, b:), (b | x == 3);
