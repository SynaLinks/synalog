# What each predicate depends on: what its bodies read (a negation, a
# combine and a raw table included), what its assertions name, and for a
# functor's result the functor and its arguments.
# Expect: valid
# Expect: dependencies Customer = ['customers']
# Expect: dependencies Order = []
# Expect: dependencies Spend = ['Order']
# Expect: dependencies Quiet = ['Customer', 'Order', 'Spend']
# Expect: dependencies Vip = ['Customer', 'Spend']
# Expect: dependencies Top = ['Base', 'Vip']

Customer(id:) :- customers(id:);
Order(id: 1, customer: 1, amount: 10);
Order(id: 2, customer: 1, amount: 20);
Spend(customer:, total? += amount) distinct :- Order(customer:, amount:);
# Read in a combine only, and named by the assertion only.
@Assert(Quiet, no_spend: "∀ c, Quiet c → ¬∃ t, Spend c t");
Quiet(id:) :- Customer(id:), 0 == (combine += 1 :- Order(customer: id));
Vip(id:) :- Customer(id:), ~Spend(customer: id);
Base(id:) :- id in [1, 2];
Top := Vip(Customer: Base);
