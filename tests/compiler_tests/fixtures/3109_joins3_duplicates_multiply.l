# Test: A join with duplicate rows keeps every combination. (from tests/programs/joins3/duplicates_multiply.l)

A(k: 1);
A(k: 1);
B(k: 1);
B(k: 1);
Q(n? += 1) distinct :- A(k:), B(k:);
