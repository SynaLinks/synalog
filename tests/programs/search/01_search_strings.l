# Rows where a column matches a regular expression.
# Expect: search O ^b = [("banana",), ("blue",)]
@OrderBy(O, "s");
O(s:) :- s in ["apple", "banana", "blue", "cab"];
