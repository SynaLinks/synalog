# Test: A predicate name holds no dollar. (from tests/programs/injection/predicate_name_with_a_dollar.l)
A${x}(y: 1);
Q(y:) :- A${x}(y:);
