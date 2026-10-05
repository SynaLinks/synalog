# The first depth computed into tables.
# Expect: rows R = [(21,)]
Next(x:, y: x + 1) :- x in Range(100);
@Recursive(Reach, 21);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
R(m? Max= y) distinct :- Reach(y:);
