# Test: A field name holds no dollar: it is written into SQL. (from tests/programs/injection/field_name_with_a_dollar.l)
Q(`a${env:HOME}`: 1);
