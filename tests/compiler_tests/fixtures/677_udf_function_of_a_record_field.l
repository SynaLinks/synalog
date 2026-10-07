# Test: A function of a record field. (from tests/programs/udf/19_function_of_a_record_field.l)

Triple(x) = 3 * x;
V(r: {a: 2});
S(v: Triple(r.a)) :- V(r:);
