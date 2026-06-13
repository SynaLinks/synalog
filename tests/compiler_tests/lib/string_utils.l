# String utility predicates for import testing

# Greet a person
Greeting(name, message) :- message == "Hello, " ++ name ++ "!";

# Format with prefix
WithPrefix(prefix, value, result) :- result == prefix ++ ": " ++ value;
