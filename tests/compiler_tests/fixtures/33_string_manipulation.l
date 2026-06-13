# Test: String manipulation functions

Names(first: "alice", last: "smith");
Names(first: "bob", last: "jones");
Names(first: "charlie", last: "brown");

# String transformations
@OrderBy(FormattedNames, "first");
FormattedNames(first:, upper_first: Upper(first), len: Length(last)) :-
  Names(first:, last:);

@OrderBy(Test, "first");
Test(first:, upper_first:, len:) :- FormattedNames(first:, upper_first:, len:);
