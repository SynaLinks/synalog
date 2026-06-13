# Test: Split string into array

Rows(line: "a,b,c");
Rows(line: "x,y");

# Split into array, then read size and first element
@OrderBy(Parsed, "line");
Parsed(line:, n:, first:) :-
  Rows(line:),
  parts == Split(line, ","),
  n == Size(parts),
  first == Element(parts, 0);

@OrderBy(Test, "line");
Test(line:, n:, first:) :- Parsed(line:, n:, first:);
