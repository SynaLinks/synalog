# Test: String operations

Names(first: "Alice", last: "Smith");
Names(first: "Bob", last: "Jones");

# String concatenation with ++
FullName(name: first ++ " " ++ last) :- Names(first:, last:);

# Multiple concatenations
Greeting(msg: "Hello, " ++ first ++ " " ++ last ++ "!") :- Names(first:, last:);

@OrderBy(Test, "name");
Test(name:) :- FullName(name:);
