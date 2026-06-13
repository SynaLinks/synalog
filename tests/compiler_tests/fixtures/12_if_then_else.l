# Test: If-then-else expressions

Number(x) :- x in Range(15);

# Simple if-then-else
Grade(score: x, letter: (if x >= 9 then "A" else "B")) :- Number(x), x >= 6;

# Nested if-then-else
DetailedGrade(score: x, letter:) :-
  Number(x),
  letter == (if x >= 12 then "A"
             else if x >= 9 then "B"
             else if x >= 6 then "C"
             else if x >= 3 then "D"
             else "F");

# If-then-else with arithmetic
Adjusted(x, value: (if x < 5 then x * 2 else x + 10)) :- Number(x);

@OrderBy(Test, "score");
Test(score:, letter:) :- DetailedGrade(score:, letter:);
