# Verifier Test: Reference to an undefined predicate (typo)
# Expected Error: undefinedPredicate
#
# A name in predicate position written in the concept convention (initial
# uppercase) that is neither defined in the program, a built-in, nor a raw
# database table is almost always a typo. The verifier flags it and, when a
# defined predicate is within edit-distance range, suggests the intended name.
# Here `Custmer` is an undefined reference to the defined `Customer` concept.

Customer(id:, name:) :- customers(id:, name:);
Greeting(id:, name:) :- Custmer(id:, name:);
