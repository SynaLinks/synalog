# synalog splits a predicate with several aggregating bodies into one
# rule per body: they are the predicate's, not dependencies of their own.
# Expect: valid
# Expect: dependencies Total = ['Credit', 'Debit']

Credit(k: "a", v: 1);
Debit(k: "a", v: 2);
Total(k:, v? += v) distinct :- Credit(k:, v:);
Total(k:, v? += v) distinct :- Debit(k:, v:);
