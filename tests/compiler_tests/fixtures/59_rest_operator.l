# Test: rest-of (..) operator — pass remaining columns through

Record(a: 1, b: 2, c: 3);
Record(a: 4, b: 5, c: 6);

# Copy every column through using ..
@OrderBy(CopyAll, "a");
CopyAll(..rest) :- Record(..rest);

@OrderBy(Test, "a");
Test(a:, b:, c:) :- CopyAll(a:, b:, c:);
