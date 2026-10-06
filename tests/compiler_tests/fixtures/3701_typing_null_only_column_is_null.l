# Test: A column of nulls only, tested. (from tests/programs/typing/null_only_column_is_null.l)

V(k: 1, v: null);
V(k: 2, v: null);
Q(n? += 1) distinct :- V(v:), v is null;
