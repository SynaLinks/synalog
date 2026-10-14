# A table name holds no dollar: it is written into SQL.
# Expect: error is not a table name
Q(x:) :- `t${env:HOME}`(x:);
