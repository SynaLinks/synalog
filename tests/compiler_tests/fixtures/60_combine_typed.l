# Test: combine over a non-numeric column (exercises type inference for psql CAST)

Words(word: "apple");
Words(word: "banana");
Words(word: "cherry");

# Max over a string column -> result type is text (not numeric).
LongestWord(longest:) :- longest == (combine Max= word :- Words(word:));

@OrderBy(Test, "longest");
Test(longest:) :- LongestWord(longest:);
