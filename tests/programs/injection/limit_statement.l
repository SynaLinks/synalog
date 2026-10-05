# @Limit takes a number of rows.
# Expect: error the limit must be a whole number
V(x: 1);
@Limit(Q, "1; DROP TABLE t");
Q(x:) :- V(x:);
