# Test: String concatenation edge cases

# Basic data
Person("John", "Doe");
Person("Jane", "Smith");
Person("Bob", "");

# Simple concatenation
FullName(first, last, full_name) :-
  Person(first, last),
  full_name == first ++ " " ++ last;

# Multiple concatenations
Greeting(first, last, msg) :-
  Person(first, last),
  msg == "Hello, " ++ first ++ " " ++ last ++ "!";

# Concatenation with numbers (via ToString)
Numbered(first, last, label) :-
  Person(first, last),
  label == first ++ "_" ++ ToString(1);

# Empty string concatenation
WithEmpty(first, last, result) :-
  Person(first, last),
  result == first ++ "" ++ last;

@OrderBy(Test, "full_name");
Test(first:, last:, full_name:) :- FullName(first, last, full_name);
