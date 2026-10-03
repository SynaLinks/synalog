# A depth beyond what a script can hold is refused at compile time.
# Expect: compile-error Reach asks for more steps than a SQL script can hold
Next(x:, y: x + 1) :- x in Range(10);
@Recursive(Reach, 5000);
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
