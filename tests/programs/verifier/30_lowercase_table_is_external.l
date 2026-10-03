# A lowercase name is a database table: not undefined.
# Expect: valid
Order(id:) :- orders(id:);
