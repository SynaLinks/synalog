# A field name holds no dollar: it is written into SQL.
# Expect: error A field name may not hold '$'
Q(`a${env:HOME}`: 1);
