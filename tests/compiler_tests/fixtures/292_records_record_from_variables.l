# Test: Building a record from variables, then reading it back. (from tests/programs/records/03_record_from_variables.l)

P(name: "ann", n: 3);
Q(rec:) :- P(name:, n:), rec == {name:, n:};
X(name:, n:) :- Q(rec:), name == rec.name, n == rec.n;
