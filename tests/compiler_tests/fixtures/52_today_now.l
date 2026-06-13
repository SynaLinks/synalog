# Test: Today / Now built-in temporal concepts (compiler-inlined per dialect).
# Within one statement an engine reads the current date and timestamp from the
# same clock, so the date prefix of Now's timestamp equals Today's date. This
# keeps the result deterministic and independent of the date the test runs on.

Tick(n: 1);

@OrderBy(Test, "n");
Test(n:) :-
  Tick(n:),
  Today(date:),
  Now(timestamp:),
  Substr(ToString(timestamp), 1, 10) == date;
