# Test: Numbers as text sort as text. (from tests/programs/strings2/text_sorts_not_as_numbers.l)

V(n: 3);
V(n: 12);
V(n: 100);
@OrderBy(Q, "s");
Q(s: ToString(n)) :- V(n:);
