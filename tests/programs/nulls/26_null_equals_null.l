# Null equals null, and differs from a value: null is a value, as a constant
# of Datalog is.
# Expect: rows Q = [('equal',), ('null differs from 1',)]
@OrderBy(Q, "r");
Q(r: "equal") :- null == null;
Q(r: "differs") :- null != null;
Q(r: "null equals 1") :- V(x:), x == 1;
Q(r: "null differs from 1") :- V(x:), x != 1;
V(x: null);
